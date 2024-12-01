import 'package:flutter/material.dart';

typedef WidgetCallback = Function(WidgetItem);

/*
This is an abstract class or interface for InfoViewItem and ListViewItem.
*/

abstract class WidgetItem {
  String get title;
  bool get hasImage;
  String? get imagePath;
  String? get videoPath;
  String get link;
  Widget getWidget(BuildContext context, WidgetCallback onChangeWidget);
}
