import 'package:hendrix_tours_app/objects/widget_item.dart';
import 'package:flutter/material.dart';

Color hendrixOrange = const Color.fromRGBO(245, 130, 42, 1);

/*
This class contains the data and returns a widget of itself with buildWidget.
*/
class ListViewItem implements WidgetItem {
  ListViewItem({required this.title, required this.child, required this.imagePath, required this.isListView, required this.link});
  String title;
  //child - use an interface so either ListViewItem or InfoViewItem can be called as children
  List<WidgetItem> child;
  String imagePath;
  bool isListView;
  String link;

  @override
  String toString() {
    return title;
  }

  @override
  Widget getWidget(context) {

    List<Widget> listViewList = [];

    for(WidgetItem i in child) {
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