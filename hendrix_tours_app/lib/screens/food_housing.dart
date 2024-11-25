import 'package:flutter/material.dart';
import 'package:hendrix_tours_app/templates/main_page_template.dart';
import 'package:hendrix_tours_app/objects/list_view_item.dart';

class FoodHousingPage extends StatelessWidget {
  const FoodHousingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainPageTemplate(
      pageTitle: 'Food and Housing',
      hasImage: true,
      imagePath: 'assets/images/housing.jpg',
      contentWidget: CustomFoodHousingView(),
    );
  }
}

class CustomFoodHousingView extends ListViewItem {
  CustomFoodHousingView()
      : super(
          title: 'Food and Housing',
          child: const [],
          imagePath: '',
          isListView: true,
          link: '',
        );

  @override
  Widget getWidget(BuildContext context) {
    return Column(
      children: [
        HendrixButton(
          text: 'The Caf',
          onPressed: () {
            // Add navigation when page is created
          },
        ),
        const SizedBox(height: 16),
        HendrixButton(
          text: 'The Burrow',
          onPressed: () {
            // Add navigation when page is created
          },
        ),
        const SizedBox(height: 16),
        HendrixButton(
          text: 'Northside Halls',
          onPressed: () {
            // Add navigation when page is created
          },
        ),
        const SizedBox(height: 16),
        HendrixButton(
          text: 'Southside Halls',
          onPressed: () {
            // Add navigation when page is created
          },
        ),
        const SizedBox(height: 16),
        HendrixButton(
          text: 'Apartments',
          onPressed: () {
            // Add navigation when page is created
          },
        ),
        const SizedBox(height: 16),
        HendrixButton(
          text: 'The Houses',
          onPressed: () {
            // Add navigation when page is created
          },
        ),
        const SizedBox(height: 16),
        HendrixButton(
          text: 'Residence Life: What To Expect',
          onPressed: () {
            // Add navigation when page is created
          },
        ),
      ],
    );
  }
}
