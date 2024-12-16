import 'package:flutter/material.dart';
import 'package:hendrix_tours_app/objects/info_view_item.dart';
import 'package:hendrix_tours_app/objects/list_view_item.dart';
import 'package:hendrix_tours_app/objects/widget_item.dart';
import 'package:hendrix_tours_app/objects/video_player_widget.dart'; // Import the VideoPlayerWidget
import 'package:hendrix_tours_app/structures/stack_data.dart';
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
    super.key,
    required this.text,
    this.onPressed,
  });

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

class MainPageTemplate extends StatefulWidget {
  //final String pageTitle;
  //final bool hasImage;
  //final String? imagePath; // Path for image display
  //final String? videoPath; // Path for video playback
  final WidgetItem rootWidget;
  final bool showBackButton;

  const MainPageTemplate({
    super.key,
    //required this.pageTitle,
    //required this.hasImage,
    //this.imagePath,
    //this.videoPath,
    required this.rootWidget,
    this.showBackButton = true,
  });

  @override
  State<StatefulWidget> createState() => MainPageTemplateState();
}

class MainPageTemplateState extends State<MainPageTemplate> {
  String pageTitle = '';
  bool hasImage = false;
  String? imagePath; // Path for image display
  String? videoPath; // Path for video playback
  WidgetItem? contentWidget;
  WidgetItem? rootWidget;
  bool showBackButton = false;
  String link = '';
  String visitLink = 'https://www.hendrix.edu/visit/';
  StackData stack = StackData();

  // Launches the visit url
  Future<void> _launchUrl() async {
    final Uri url = Uri.parse(visitLink);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  // Launches the url associated with the page
  Future<void> _launchConUrl() async {
    final Uri url = Uri.parse(link);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  void _setCurrentContentWidget(WidgetItem newContent) {
    setState(() {
      contentWidget = newContent;
      pageTitle = contentWidget!.title;
      hasImage = contentWidget!.hasImage;
      imagePath = contentWidget!.imagePath;
      videoPath = contentWidget!.videoPath;
      link = contentWidget!.link;
      stack.push(contentWidget);
    });
  }

  void _goBack() {
    setState(() {
      stack.pop();
      contentWidget = stack.peek();
      pageTitle = contentWidget!.title;
      hasImage = contentWidget!.hasImage;
      imagePath = contentWidget!.imagePath;
      videoPath = contentWidget!.videoPath;
      link = contentWidget!.link;
    });
  }

  void _goHome() {
    setState(() {
      stack = StackData();
      stack.push(rootWidget);
      contentWidget = stack.peek();
      pageTitle = contentWidget!.title;
      hasImage = contentWidget!.hasImage;
      imagePath = contentWidget!.imagePath;
      videoPath = contentWidget!.videoPath;
      link = contentWidget!.link;
    });
  }

  @override
  void initState() {
    rootWidget = widget.rootWidget;
    contentWidget = widget.rootWidget;
    pageTitle = contentWidget!.title;
    hasImage = contentWidget!.hasImage;
    imagePath = contentWidget!.imagePath;
    videoPath = contentWidget!.videoPath;
    link = contentWidget!.link;
    stack.push(rootWidget);
    super.initState();
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
            title: Row(children: [
              if (contentWidget != rootWidget) ...{
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: _goBack,
                ),
              }
            ]),
            backgroundColor: const Color.fromRGBO(245, 130, 42, 1),
            iconTheme: const IconThemeData(color: Colors.white),
            actions: [
              IconButton(
                icon: const Icon(Icons.launch),
                onPressed: _launchConUrl,
              ),
            ],
            flexibleSpace: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text(
                  //   'Hendrix Tours',
                  //   style: Theme.of(context).textTheme.displayLarge,
                  // ),
                  Image.asset(
                    'lib/assets/Logo.png',
                    height: 40,
                    fit: BoxFit.contain,
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
          child: Column(
            children: [
              if (videoPath != null) ...[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: VideoPlayerWidget(
                        videoUrl:
                            videoPath!), // Play video if a path is provided
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
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: contentWidget!
                        .getWidget(context, _setCurrentContentWidget),
                  ),
                ),
              ),
            ],
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
              if (contentWidget != rootWidget) ...[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ElevatedButton.icon(
                      onPressed: _goHome,
                      icon: const Icon(Icons.home),
                      label: const Text(
                        'Back Home',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
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
                        fontSize: 14,
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
