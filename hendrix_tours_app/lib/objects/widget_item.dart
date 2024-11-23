import 'package:flutter/material.dart';

/*
This is an abstract class or interface for InfoViewItem and ListViewItem.
*/

abstract class WidgetItem {
  Widget getWidget(context);
}