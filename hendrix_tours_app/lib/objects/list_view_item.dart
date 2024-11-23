import 'package:hendrix_tours_app/objects/widget_item.dart';
import 'package:flutter/material.dart';

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
    
  }
}