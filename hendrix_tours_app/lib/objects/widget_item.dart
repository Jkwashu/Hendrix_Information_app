import 'package:flutter/material.dart';

/*
This is an abstract class or interface for InfoViewItem and ListViewItem.
*/

abstract class WidgetItem {
  String get title;
  String? get imagePath;
  Widget getWidget(BuildContext context);
}
