
class ListViewItem {
  ListViewItem({required this.title, required this.imagePath, required this.isListView, required this.link});
  String title;
  //child - use an interface so either ListViewItem or InfoViewItem can be called as children
  String imagePath;
  bool isListView;
  String link;

  @override
  String toString() {
    return title;
  }
}