import 'package:flutter/material.dart';
import 'package:hendrix_tours_app/templates/main_page_template.dart';
import 'package:hendrix_tours_app/objects/list_view_item.dart';

class AcademicsPage extends StatelessWidget {
  const AcademicsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Create the ListView content
    final academicsContent = ListViewItem(
      title: 'Academics',
      child: [
        ListViewItem(
          title: 'Majors',
          child: [],
          imagePath: '',
          isListView: true,
          link: '',
        ),
        ListViewItem(
          title: 'Departments',
          child: [],
          imagePath: '',
          isListView: true,
          link: '',
        ),
      ],
      imagePath: 'assets/images/academics.jpg', // Add your image path
      isListView: true,
      link: '',
    );

    return MainPageTemplate(
      pageTitle: 'Academics',
      hasImage: true,
      imagePath: academicsContent.imagePath,
      contentWidget: academicsContent,
    );
  }
}
