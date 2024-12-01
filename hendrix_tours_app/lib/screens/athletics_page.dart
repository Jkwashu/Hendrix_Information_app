import 'package:flutter/material.dart';
import 'package:hendrix_tours_app/templates/main_page_template.dart';
import 'package:hendrix_tours_app/objects/list_view_item.dart';

class AthleticsPage extends StatelessWidget {
  const AthleticsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainPageTemplate(
      // pageTitle: 'Athletics',
      // hasImage: true,
      // imagePath: 'lib/assets/athletics.jpg',
      contentWidget: CustomAthleticsView(),
    );
  }
}

class CustomAthleticsView extends ListViewItem {
  CustomAthleticsView()
      : super(
          title: 'Athletics',
          child: const [],
          hasImage: true,
          imagePath: 'lib/assets/athletics.jpg',
          isListView: true,
          link: '',
        );

  @override
  Widget getWidget(BuildContext context, onChangeWidget) {
    return Column(
      children: [
        HendrixButton(
          text: 'Wellness and Athletics Center',
          onPressed: () {
            // Add navigation when page is created
          },
        ),
        const SizedBox(height: 16),
        HendrixButton(
          text: 'Sturgis Athletic Center',
          onPressed: () {
            // Add navigation when page is created
          },
        ),
        const SizedBox(height: 16),
        HendrixButton(
          text: 'Young-Wise Memorial Stadium',
          onPressed: () {
            // Add navigation when page is created
          },
        ),
        const SizedBox(height: 16),
        HendrixButton(
          text: 'Hatcher Tennis Center',
          onPressed: () {
            // Add navigation when page is created
          },
        ),
        const SizedBox(height: 16),
        HendrixButton(
          text: 'Warrior Soccer Field',
          onPressed: () {
            // Add navigation when page is created
          },
        ),
        const SizedBox(height: 16),
        HendrixButton(
          text: 'Warrior Baseball Field',
          onPressed: () {
            // Add navigation when page is created
          },
        ),
        const SizedBox(height: 16),
        HendrixButton(
          text: 'Warrior Softball Field',
          onPressed: () {
            // Add navigation when page is created
          },
        ),
        const SizedBox(height: 16),
        HendrixButton(
          text: 'Warrior Lacrosse Field',
          onPressed: () {
            // Add navigation when page is created
          },
        ),
      ],
    );
  }
}
