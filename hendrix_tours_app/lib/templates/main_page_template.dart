import 'package:flutter/material.dart';
import 'package:hendrix_tours_app/objects/info_view_item.dart';
import 'package:hendrix_tours_app/objects/list_view_item.dart';
import 'package:hendrix_tours_app/objects/widget_item.dart';
import 'package:hendrix_tours_app/objects/video_player_widget.dart'; // Import the VideoPlayerWidget
import 'package:url_launcher/url_launcher.dart';

// Standard button style to be used across all pages
class HendrixButtonStyle {
  static ButtonStyle get standard => ElevatedButton.styleFrom(
        backgroundColor: const Color.fromRGBO(245, 130, 42, 1),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      );
}

// Standard button widget to ensure consistency
class HendrixButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const HendrixButton({
    Key? key,
    required this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: onPressed,
        style: HendrixButtonStyle.standard,
        child: Text(
          text,
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: Colors.black,
              ),
        ),
      ),
    );
  }
}

class MainPageTemplate extends StatelessWidget {
  final String pageTitle;
  final bool hasImage;
  final String? imagePath; // Path for image display
  final String? videoPath; // Path for video playback
  final WidgetItem contentWidget;
  final bool showBackButton;

  const MainPageTemplate({
    Key? key,
    required this.pageTitle,
    required this.hasImage,
    this.imagePath,
    this.videoPath,
    required this.contentWidget,
    this.showBackButton = true,
  }) : super(key: key);

  Future<void> _launchUrl() async {
    final Uri url = Uri.parse('https://www.hendrix.edu/visit/');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: AppBar(
            backgroundColor: const Color.fromRGBO(245, 130, 42, 1),
            iconTheme: const IconThemeData(color: Colors.white),
            flexibleSpace: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hendrix Tours',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    pageTitle,
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                if (videoPath != null) ...[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 200,
                      child: VideoPlayerWidget(videoUrl: videoPath!), // Play video if a path is provided
                    ),
                  ),
                ],
                if (hasImage && videoPath == null) ...[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                        image: imagePath != null
                            ? DecorationImage(
                                image: AssetImage(imagePath!),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                      child: imagePath == null
                          ? const Center(child: Text('Media Placeholder'))
                          : null,
                    ),
                  ),
                ],
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: contentWidget.getWidget(context),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (showBackButton) ...[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.popUntil(context, (route) => route.isFirst);
                      },
                      icon: const Icon(Icons.home),
                      label: const Text(
                        'Back to Home',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: HendrixButtonStyle.standard,
                    ),
                  ),
                ),
              ],
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: showBackButton ? 8.0 : 0),
                  child: ElevatedButton.icon(
                    onPressed: _launchUrl,
                    icon: const Icon(Icons.calendar_today),
                    label: const Text(
                      'Plan a Visit',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: HendrixButtonStyle.standard,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
