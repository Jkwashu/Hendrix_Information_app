import 'widget_item.dart';

/*
This class contains data for the InfoView screen and will return a widget displaying itself.
*/
class InfoViewItem implements WidgetItem {
  InfoViewItem({required this.title,
  required this.description,
  required this.imagePath,
  required this.connBuildings,
  required this.connDepartments,
  required this.link,
  });
  String title;
  String description;
  String imagePath;
  List<InfoViewItem> connBuildings;
  List<InfoViewItem> connDepartments;
  String link;

  @override
  void buildWidget() {

  }
}