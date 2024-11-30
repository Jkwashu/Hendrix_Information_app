import 'package:flutter/material.dart';
import 'package:hendrix_tours_app/templates/main_page_template.dart';
import 'package:hendrix_tours_app/objects/list_view_item.dart';

import '../objects/info_view_item.dart';

class FoodHousingPage extends StatelessWidget {
  const FoodHousingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainPageTemplate(
      // pageTitle: 'Food and Housing',
      // hasImage: true,
      // imagePath: 'lib/assets/foodandhousing.jpg',
      contentWidget: CustomFoodHousingView(),
    );
  }
}

class CustomFoodHousingView extends ListViewItem {
  CustomFoodHousingView()
      : super(
          title: 'Food and Housing',
          child: const [],
          hasImage: true,
          imagePath: 'lib/assets/foodandhousing.jpg',
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
          text: 'Northside Dorms',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NorthPage()),
            );
          },
        ),
        const SizedBox(height: 16),
        HendrixButton(
          text: 'Southside Dorms',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SouthPage()),
            );
          },
        ),
        const SizedBox(height: 16),
        HendrixButton(
          text: 'Apartments',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AptPage()),
            );
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

class NorthPage extends StatelessWidget {
  const NorthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainPageTemplate(
      // pageTitle: 'Northside Dorms',
      // hasImage: true,
      // imagePath: 'lib/assets/northside.jpg',
      contentWidget: CustomNorthView(),
    );
  }
}

class CustomNorthView extends ListViewItem {
  CustomNorthView()
      : super(
          title: 'Northside Dorms',
          child: const [],
          hasImage: true,
          imagePath: 'lib/assets/northside.jpg',
          isListView: true,
          link: '',
        );

  @override
  Widget getWidget(BuildContext context) {
    return Column(
      children: [
        HendrixButton(
          text: 'Galloway Hall',
          onPressed: () {
            // Add navigation when page is created
          },
        ),
        const SizedBox(height: 16),
        HendrixButton(
          text: 'Miller Hall',
          onPressed: () {
            // Add navigation when page is created
          },
        ),
        const SizedBox(height: 16),
        HendrixButton(
          text: 'Raney Hall',
          onPressed: () {
            // Add navigation when page is created
          },
        ),
        const SizedBox(height: 16),
        HendrixButton(
          text: 'Miller Creative Quad',
          onPressed: () {
            // Add navigation when page is created
          },
        ),
      ],
    );
  }
}

class SouthPage extends StatelessWidget {
  const SouthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainPageTemplate(
      // pageTitle: 'Southside Dorms',
      // hasImage: true,
      // imagePath: 'lib/assets/southside.jpg',
      contentWidget: CustomSouthView(),
    );
  }
}

class CustomSouthView extends ListViewItem {
  CustomSouthView()
      : super(
          title: 'Southside Dorms',
          child: const [],
          hasImage: true,
          imagePath: 'lib/assets/southside.jpg',
          isListView: true,
          link: '',
        );

  @override
  Widget getWidget(BuildContext context) {
    return Column(
      children: [
        HendrixButton(
          text: 'Couch Hall',
          onPressed: () {
            // Add navigation when page is created
          },
        ),
        const SizedBox(height: 16),
        HendrixButton(
          text: 'Hardin Hall',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CustomHardinView()),
            );
          },
        ),
        const SizedBox(height: 16),
        HendrixButton(
          text: 'Martin Hall',
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
      ],
    );
  }
}

class AptPage extends StatelessWidget {
  const AptPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainPageTemplate(
      // pageTitle: 'Apartments',
      // hasImage: true,
      // imagePath: 'lib/assets/apartments.jpg',
      contentWidget: CustomAptView(),
    );
  }
}

class CustomAptView extends ListViewItem {
  CustomAptView()
      : super(
          title: 'Apartments',
          child: const [],
          hasImage: true,
          imagePath: 'lib/assets/apartments.jpg',
          isListView: true,
          link: '',
        );

  @override
  Widget getWidget(BuildContext context) {
    return Column(
      children: [
        HendrixButton(
          text: 'Clifton St. Apartments',
          onPressed: () {
            // Add navigation when page is created
          },
        ),
        const SizedBox(height: 16),
        HendrixButton(
          text: 'Front St. Apartments',
          onPressed: () {
            // Add navigation when page is created
          },
        ),
        const SizedBox(height: 16),
        HendrixButton(
          text: 'Huntington Apartmments',
          onPressed: () {
            // Add navigation when page is created
          },
        ),
        const SizedBox(height: 16),
        HendrixButton(
          text: 'The Hendrix Corner',
          onPressed: () {
            // Add navigation when page is created
          },
        ),
        const SizedBox(height: 16),
        HendrixButton(
          text: 'Market Square East',
          onPressed: () {
            // Add navigation when page is created
          },
        ),
        const SizedBox(height: 16),
        HendrixButton(
          text: 'Market Square North',
          onPressed: () {
            // Add navigation when page is created
          },
        ),
      ],
    );
  }
}

class CustomHardinView extends StatelessWidget {
  const CustomHardinView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hardinContent = InfoViewItem(
      title: 'Hardin Hall',
      description: 'Hardin Hall is home to 143 men that live in 68 double-occupancy rooms and seven single rooms. This residence hall for men was constructed in 1964 and can accommodate 143 residents. The men of Hardin Hall are known as "The Men of Distinction" and enjoy the camaraderie of living in an all male environment.  The students of Hardin enjoy gathering in the lobby to play pool and watch TV as well as a healthy gaming community.',
      hasImage: false,
      videoPath: 'https://drive.google.com/uc?export=download&id=1KMvSR-THv4RVfYMjvyCbki_yRYYZdWWa',
      connBuildings: [],
      connDepartments: [],
      link: '',
    );

    return MainPageTemplate(
      // pageTitle: hardinContent.title,
      // hasImage: false,
      // imagePath: hardinContent.imagePath,
      contentWidget: hardinContent,
    );
  }
}