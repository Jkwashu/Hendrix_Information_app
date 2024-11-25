import 'package:flutter/material.dart';
import 'package:hendrix_tours_app/objects/info_view_item.dart';
import 'package:hendrix_tours_app/objects/list_view_item.dart';
import 'package:hendrix_tours_app/objects/widget_item.dart';
import 'package:url_launcher/url_launcher.dart';

class MainPageTemplate extends StatelessWidget {
  final String title;
  final bool hasImage; // Determines if we show image or video container
  final String? imagePath; // Optional path to image
  final String? videoPath; // Optional path to video
  final WidgetItem contentWidget; // Either InfoViewItem or ListViewItem
  final bool showBackButton; // Whether to show the back button in bottom bar

  const MainPageTemplate({
    Key? key,
    required this.title,
    required this.hasImage,
    this.imagePath,
    this.videoPath,
    required this.contentWidget,
    this.showBackButton = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // Handle back button press
      onWillPop: () async {
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(title, style: Theme.of(context).textTheme.displayLarge),
          backgroundColor: const Color.fromRGBO(245, 130, 42, 1),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Media Container
                if (hasImage) ...[
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

                // Content Widget (InfoView or ListView)
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
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(245, 130, 42, 1),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: showBackButton ? 8.0 : 0),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      _launchUrl();
                    },
                    icon: const Icon(Icons.calendar_today),
                    label: const Text(
                      'Plan a Visit',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(245, 130, 42, 1),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
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

final Uri _url = Uri.parse('https://www.hendrix.edu/visit/');

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}
