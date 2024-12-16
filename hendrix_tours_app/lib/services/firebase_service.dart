import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hendrix_tours_app/objects/info_view_item.dart';
import 'package:hendrix_tours_app/objects/list_view_item.dart';
import 'package:hendrix_tours_app/objects/widget_item.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<WidgetItem> getPage(String pageId) async {
    print('Fetching page: $pageId'); // Debug log

    final doc = await _firestore.collection('pages').doc(pageId).get();

    if (!doc.exists) {
      throw Exception('Page not found: $pageId');
    }

    final data = doc.data()!;
    print('Retrieved data for $pageId: $data'); // Debug log

    final type = data['type'] as String;

    if (type == 'list') {
      return await _createListViewItem(data, pageId);
    } else {
      return _createInfoViewItem(data);
    }
  }

  Future<ListViewItem> _createListViewItem(
      Map<String, dynamic> data, String pageId) async {
    print('Creating ListViewItem for $pageId'); // Debug log

    final childPages = List<String>.from(data['childPages'] ?? []);
    print('Child pages: $childPages'); // Debug log

    List<WidgetItem> children = [];

    // Fetch all child pages
    for (String childId in childPages) {
      try {
        print('Fetching child page: $childId'); // Debug log
        final childWidget = await getPage(childId);
        children.add(childWidget);
        print('Successfully added child: $childId'); // Debug log
      } catch (e) {
        print('Error loading child page $childId: $e'); // Debug log
      }
    }

    print('Created ListViewItem with ${children.length} children'); // Debug log

    return ListViewItem(
      title: data['title'],
      child: children,
      hasImage: data['hasImage'] ?? false,
      imagePath: data['imagePath'],
      videoPath: data['videoPath'],
      isListView: true,
      link: data['link'] ?? '',
    );
  }

  Future<InfoViewItem> _createInfoViewItem(
    Map<String, dynamic> data) async {
    print('Creating InfoViewItem'); // Debug log

    final connBuildingsList = List<String>.from(data['connBuildings'] ?? []);
    final connDepartmentsList = List<String>.from(data['connBuildings'] ?? []);

    List<WidgetItem> buildings = [];
    List<WidgetItem> departments = [];

    for (String connBuildingsId in connBuildingsList) {
      try {
        print('Fetching child page: $connBuildingsId'); // Debug log
        final childWidget = await getPage(connBuildingsId);
        buildings.add(childWidget);
        print('Successfully added child: $connBuildingsId'); // Debug log
      } catch (e) {
        print('Error loading child page $connBuildingsId: $e'); // Debug log
      }
    }

    for (String connDepartmentsId in connDepartmentsList) {
      try {
        print('Fetching child page: $connDepartmentsId'); // Debug log
        final childWidget = await getPage(connDepartmentsId);
        buildings.add(childWidget);
        print('Successfully added child: $connDepartmentsId'); // Debug log
      } catch (e) {
        print('Error loading child page $connDepartmentsId: $e'); // Debug log
      }
    }

    return InfoViewItem(
      title: data['title'],
      description: data['description'],
      hasImage: data['hasImage'] ?? false,
      imagePath: data['imagePath'],
      videoPath: data['videoPath'],
      connBuildings: buildings,
      connDepartments: departments,
      link: data['link'] ?? '',
    );
  }
}
