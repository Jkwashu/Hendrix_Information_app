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
  late Future<void> _initializeVideoPlayerFuture;
  bool _isPlaying = false; // Track play/pause state locally

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(widget.videoUrl),
    );
    _initializeVideoPlayerFuture = _controller.initialize().then((_) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) setState(() {}); // Ensure rebuild after initialization
      });
    }).catchError((error) {
      debugPrint('Error initializing video: $error');
    });
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    Duration position = _controller.value.position;
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
        _isPlaying = false;
      } else {
        _controller.seekTo(position);
        _controller.play();
        _isPlaying = true;
      }
      debugPrint('isPlaying state: $_isPlaying'); // Debug current play/pause state
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Stack(
            alignment: Alignment.center,
            children: [
              // Video Player
              AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),

              // GestureDetector for play/pause toggle
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
              if (!_isPlaying)
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
                ),
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(), // Show loading spinner
          );
        }
      },
    );
  }
}
