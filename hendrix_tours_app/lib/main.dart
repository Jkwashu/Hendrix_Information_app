import 'package:flutter/material.dart';
import 'package:hendrix_tours_app/objects/theme_data.dart';
import 'package:hendrix_tours_app/screens/academics_page.dart';
import 'package:hendrix_tours_app/screens/athletics_page.dart';
import 'package:hendrix_tours_app/screens/student_life_page.dart';
import 'package:hendrix_tours_app/screens/food_housing.dart';
import 'package:hendrix_tours_app/templates/main_page_template.dart';
import 'package:hendrix_tours_app/objects/list_view_item.dart';
import 'package:hendrix_tours_app/test_root.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hendrix Tours',
      theme: hendrixTodayLightMode,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainPageTemplate(
      //pageTitle: 'Welcome',
      //hasImage: false,
      // Hendrix Tours Video Path:
      //videoPath: 'https://drive.google.com/uc?export=download&id=1DIb09B9lxjHeLjcpLOxRj-b0CEOADmWX',
      // Funny Video Path:
      //videoPath: 'https://drive.google.com/uc?export=download&id=1QpEP4rnBEqwu-zaHSSwVfrU-hInBe5DG',

      rootWidget: testRoot,//CustomHomeListView(),
      showBackButton: false,
    );
  }
}

class CustomHomeListView extends ListViewItem {
  CustomHomeListView()
      : super(
          title: 'Home',
          child: const [],
          hasImage: false,
          videoPath: 'https://drive.google.com/uc?export=download&id=1DIb09B9lxjHeLjcpLOxRj-b0CEOADmWX',
          isListView: true,
          link: '',
        );

  @override
  Widget getWidget(BuildContext context, onChangeWidget) {
    return Column(
      children: [
        HendrixButton(
          text: 'Academics',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AcademicsPage()),
            );
          },
        ),
        const SizedBox(height: 16),
        HendrixButton(
          text: 'Athletics',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AthleticsPage()),
            );
          },
        ),
        const SizedBox(height: 16),
        HendrixButton(
          text: 'Food and Housing',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FoodHousingPage()),
            );
          },
        ),
        const SizedBox(height: 16),
        HendrixButton(
          text: 'Student Life',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const StudentLifePage()),
            );
          },
        ),
      ],
    );
  }
}
