import 'package:flutter/material.dart';
import 'package:hendrix_tours_app/objects/theme_data.dart';
import 'package:hendrix_tours_app/screens/academics_page.dart';
import 'package:hendrix_tours_app/screens/athletics_page.dart';
import 'package:hendrix_tours_app/screens/student_life_page.dart';
import 'package:hendrix_tours_app/screens/food_housing.dart';
import 'package:url_launcher/url_launcher.dart';

Color hendrixOrange = const Color.fromRGBO(245, 130, 42, 1);
final Uri _url = Uri.parse('https://www.hendrix.edu/visit/');

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: hendrixTodayLightMode,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hendrix Tours', style: Theme.of(context).textTheme.displayLarge), 
        backgroundColor: hendrixOrange,
        iconTheme: const IconThemeData(color: Colors.white), 
        // automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Temporary Container for the map
              Container(
                width: double.infinity,
                height: 200, // Adjust height as needed
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),                
                ),
                child: Center(
                  child: Text(
                  'MAP',
                  style: Theme.of(context).textTheme.headlineLarge,
              )
              )
              ),
              
              

              const SizedBox(height: 24), // Spacing after the box

              // Button for Academics
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AcademicsPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: hendrixOrange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Academics',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
              ),

              const SizedBox(height: 16), // Spacing between buttons

              // Button for Athletics
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AthleticsPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: hendrixOrange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Athletics',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
              ),

              const SizedBox(height: 16), // Spacing between buttons

              // Button for Food and Housing
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const FoodHousingPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: hendrixOrange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Food and Housing',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
              ),

              const SizedBox(height: 16), // Spacing between buttons

              // Button for Student Life
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const StudentLifePage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: hendrixOrange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Student Life',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Back to Home button
            // Expanded(
            //   child: Padding(
            //     padding: const EdgeInsets.only(right: 8.0),
            //     child: ElevatedButton.icon(
            //       onPressed: () {
            //         // Add navigation logic here
            //       },
            //       icon: const Icon(Icons.home),
            //       label: const Text(
            //         'Back to Home',
            //         style: TextStyle(
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //       style: ElevatedButton.styleFrom(
            //         backgroundColor: hendrixOrange,
            //         foregroundColor: Colors.white,
            //         padding: const EdgeInsets.symmetric(vertical: 12),
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(8),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // Schedule a Tour button
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Add Link Logic
                    _launchUrl();
                  },
                  icon: const Icon(Icons.calendar_today),
                  label: const Text(
                    'Plan a Visit',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: hendrixOrange,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// From: https://pub.dev/packages/url_launcher
Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}
