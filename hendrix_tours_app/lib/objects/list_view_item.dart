import 'package:flutter/material.dart';
import 'package:hendrix_tours_app/objects/widget_item.dart';
import 'package:hendrix_tours_app/templates/main_page_template.dart';

class ListViewItem implements WidgetItem {
  ListViewItem({
    required this.title,
    required this.child,
    required this.hasImage,
    this.imagePath,
    this.videoPath,
    required this.isListView,
    required this.link,
  });

  @override
  final String title;
  final List<WidgetItem> child;
  @override
  final bool hasImage;
  @override
  final String? imagePath;
  @override
  final String? videoPath;
  final bool isListView;
  @override
  final String link;

  @override
  Widget getWidget(BuildContext context, WidgetCallback onChangeWidget) {
    print('ListViewItem.getWidget called for $title'); // Debug log
    print('Number of children: ${child.length}'); // Debug log

    List<Widget> listViewList = [];

    for (WidgetItem i in child) {
      print('Processing child: ${i.title}'); // Debug log

      listViewList.add(
        const SizedBox(height: 16),
      );
      listViewList.add(
        HendrixButton(
          text: i.title,
          onPressed: () {
            print('Button pressed for: ${i.title}'); // Debug log
            onChangeWidget(i);
          },
        ),
      );
    }

    print('Created ${listViewList.length} widgets'); // Debug log

    return Column(
      children: listViewList,
    );
  }
}
