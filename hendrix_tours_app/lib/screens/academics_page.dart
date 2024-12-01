import 'package:flutter/material.dart';
import 'package:hendrix_tours_app/templates/main_page_template.dart';
import 'package:hendrix_tours_app/objects/list_view_item.dart';

class AcademicsPage extends StatelessWidget {
  const AcademicsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainPageTemplate(
      // pageTitle: 'Academics',
      // hasImage: true,
      // imagePath: 'lib/assets/academics.jpg',
      contentWidget: CustomAcademicsView(),
    );
  }
}

class CustomAcademicsView extends ListViewItem {
  CustomAcademicsView()
      : super(
          title: 'Academics',
          child: [],
          hasImage: true,
          imagePath: 'lib/assets/academics.jpg',
          isListView: true,
          link: '',
        );

  @override
  Widget getWidget(BuildContext context, onChangeWidget) {
    return Column(
      children: [
        HendrixButton(
          text: 'Majors',
          onPressed: () {
            // Add navigation when page is created
          },
        ),
        const SizedBox(height: 16),
        HendrixButton(
          text: 'Departments',
          onPressed: () {
            // Add navigation when page is created
          },
        ),
      ],
    );
  }
}
