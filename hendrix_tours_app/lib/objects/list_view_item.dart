import 'package:hendrix_tours_app/objects/widget_item.dart';
import 'package:flutter/material.dart';

Color hendrixOrange = const Color.fromRGBO(245, 130, 42, 1);

/*
This class contains the data and returns a widget of itself with buildWidget.
*/

// TODO add String videoPath and bool hasVideo

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
  String toString() {
    return title;
  }

  @override
  Widget getWidget(context) {
    List<Widget> listViewList = [];

    for (WidgetItem i in child) {
      listViewList.add(
        SizedBox(
          width: double.infinity,
          height: 60,
          child: ElevatedButton(
            onPressed: null,
            style: ElevatedButton.styleFrom(
              backgroundColor: hendrixOrange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              i.title,
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
        ),
      );
      listViewList.add(
        const SizedBox(height: 16), // Spacing between buttons
      );
    }

    return Column(
      children: listViewList,
    );
  }
}
