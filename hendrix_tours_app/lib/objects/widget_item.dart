import 'package:flutter/material.dart';

/*
This is an abstract class or interface for InfoViewItem and ListViewItem.
*/

abstract class WidgetItem {
  abstract String title;
  Widget getWidget(context);
}