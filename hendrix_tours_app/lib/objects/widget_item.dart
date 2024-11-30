import 'package:flutter/material.dart';

/*
This is an abstract class or interface for InfoViewItem and ListViewItem.
*/

abstract class WidgetItem {
  String get title;
  bool get hasImage;
  String? get imagePath;
  String? get videoPath;
  Widget getWidget(BuildContext context);
}
