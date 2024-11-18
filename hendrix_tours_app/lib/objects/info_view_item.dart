
/*
This class contains all the data to be given to the InfoViewScreen widget.
*/
class InfoViewItem {
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
}