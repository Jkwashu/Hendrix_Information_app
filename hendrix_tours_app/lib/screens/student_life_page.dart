import 'package:flutter/material.dart';
import 'package:hendrix_tours_app/templates/main_page_template.dart';
import 'package:hendrix_tours_app/objects/list_view_item.dart';
import 'package:hendrix_tours_app/objects/info_view_item.dart';

class StudentLifePage extends StatelessWidget {
  const StudentLifePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainPageTemplate(
      // pageTitle: 'Student Life',
      // hasImage: true,
      // imagePath: 'lib/assets/studentlife.jpg',
      rootWidget: CustomStudentLifeView(),
    );
  }
}

class CustomStudentLifeView extends ListViewItem {
  CustomStudentLifeView()
      : super(
          title: 'Student Life',
          child: const [],
          hasImage: true,
          imagePath: 'lib/assets/studentlife.jpg',
          isListView: true,
          link: '',
        );

  @override
  Widget getWidget(BuildContext context, onChangeWidget) {
    return Column(
      children: [
        HendrixButton(
          text: 'Clubs',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ClubsPage()),
            );
          },
        ),
        const SizedBox(height: 16),
        HendrixButton(
          text: 'Annual Events',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AnnualEventsPage()),
            );
          },
        ),
      ],
    );
  }
}

class ClubsPage extends StatelessWidget {
  const ClubsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainPageTemplate(
      // pageTitle: 'Clubs',
      // hasImage: true,
      // imagePath: 'lib/assets/clubs.jpg',
      rootWidget: CustomClubsView(),
    );
  }
}

class CustomClubsView extends ListViewItem {
  CustomClubsView()
      : super(
          title: 'Clubs',
          child: const [],
          hasImage: true,
          imagePath: 'lib/assets/clubs.jpg',
          isListView: true,
          link: '',
        );

  @override
  Widget getWidget(BuildContext context, onChangeWidget) {
    return Column(
      children: [
        HendrixButton(
          text: 'The Profile',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfileClubPage()),
            );
          },
        ),
        const SizedBox(height: 16),
        HendrixButton(
          text: 'KHDX 93.1 FM',
          onPressed: () {
            // Add navigation when page is created
          },
        ),
        const SizedBox(height: 16),
        HendrixButton(
          text: 'Student Outreach & Alternative Resources (SOAR)',
          onPressed: () {
            // Add navigation when page is created
          },
        ),
        const SizedBox(height: 16),
        HendrixButton(
          text: 'The Aonian',
          onPressed: () {
            // Add navigation when page is created
          },
        ),
        const SizedBox(height: 16),
        HendrixButton(
          text: 'Sword Club',
          onPressed: () {
            // Add navigation when page is created
          },
        ),
      ],
    );
  }
}

class AnnualEventsPage extends StatelessWidget {
  const AnnualEventsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainPageTemplate(
      // pageTitle: 'Annual Events',
      // hasImage: true,
      // imagePath: 'lib/assets/events.jpg',
      rootWidget: CustomEventsView(),
    );
  }
}

// Custom ListView for Annual Events
class CustomEventsView extends ListViewItem {
  CustomEventsView()
      : super(
          title: 'Annual Events',
          child: [],
          hasImage: true,
          imagePath: 'lib/assets/events.jpg',
          isListView: true,
          link: '',
        );

  @override
  Widget getWidget(BuildContext context, onChangeWidget) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 60,
          child: ElevatedButton(
            onPressed: () {
              // Add navigation when page is created
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(245, 130, 42, 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Orientation',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
        ),
      ],
    );
  }
}

// Profile Club page remains as InfoView
class ProfileClubPage extends StatelessWidget {
  const ProfileClubPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileContent = InfoViewItem(
      title: 'The Profile',
      description: 'The official student-run news source of Hendrix College',
      hasImage: true,
      imagePath: 'lib/assets/profile.jpg',
      connBuildings: [],
      connDepartments: [],
      link: '',
    );

    return MainPageTemplate(
      // pageTitle: 'The Profile',
      // hasImage: true,
      // imagePath: profileContent.imagePath,
      rootWidget: profileContent,
    );
  }
}
