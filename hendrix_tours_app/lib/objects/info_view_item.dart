import 'widget_item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:hendrix_tours_app/objects/video_player_widget.dart'; // Import the VideoPlayerWidget

/*
This class contains data for the InfoView screen and will return a widget displaying itself.
*/

// TODO: Add String videopath and bool hasVideo

class InfoViewItem implements WidgetItem {
  InfoViewItem({
    required this.title,
    required this.description,
    required this.hasImage,
    this.imagePath,
    this.videoPath,
    required this.connBuildings,
    required this.connDepartments,
    required this.link,
  });

  @override
  final String title;
  @override
  final bool hasImage;
  @override
  final String? imagePath; // image path
  @override
  final String? videoPath; // video path
  final String description;
  final List<InfoViewItem> connBuildings;
  final List<InfoViewItem> connDepartments;
  final String link;

  // Returns a list of TextButton objects that will connect to their associated InfoViewPage.
  List<Widget> linkTextList(context, List<InfoViewItem> list) {
    List<TextButton> connButtons = [];

    if (list.isNotEmpty) {
      for (InfoViewItem i in list) {
        connButtons.add(TextButton(
          onPressed: null, // Change once navigation is implemented
          child: Text(
            i.title,
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ));
      }

      return connButtons;
    } else {
      return [const Text("N/A")];
    }
  }

  @override
  Widget getWidget(context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            /*Center(
              child: Text(
                title,
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),*/

            const SizedBox(height: 16),

            // Description
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description:',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Building Location
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Associated Buildings:',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Column(
                    children: linkTextList(context, connBuildings),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Associated Departments
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Associated Departments:',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Column(
                    children: linkTextList(context, connDepartments),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
