import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerWidget({Key? key, required this.videoUrl}) : super(key: key);

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture; // Ensure proper initialization tracking
  bool _isPaused = true; // Start in a paused state

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(widget.videoUrl),
    );
    _initializeVideoPlayerFuture = _controller.initialize().then((_) {
      if (mounted) {
        setState(() {}); // Rebuild when video is initialized
      }
    }).catchError((error) {
      debugPrint('Error initializing video: $error');
    });
    _controller.setLooping(true); // Enable looping
  }

  @override
  void dispose() {
    _controller.dispose(); // Clean up the controller
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
        _isPaused = true; // Update state to show the overlay
      } else {
        _controller.play();
        _isPaused = false; // Update state to hide the overlay
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Stack(
            alignment: Alignment.center, // Center the overlay icon
            children: [
              // Video Player
              AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),

              // Overlay for Play Icon and GestureDetector
              GestureDetector(
                onTap: _togglePlayPause,
                child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: Container(
                    color: Colors.transparent, // Transparent to capture taps
                  ),
                ),
              ),

              // Play Icon Overlay (Visible when paused)
              if (_isPaused)
              GestureDetector(
                onTap: _togglePlayPause,
                child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: Container(
                    color: Colors.black45, // Semi-transparent black background
                    child: const Center(
                      child: Icon(
                        Icons.play_arrow_rounded,
                        size: 64,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        } else {
          // Show loading spinner while video initializes
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
