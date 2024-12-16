import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hendrix_tours_app/firebase_options.dart';
import 'package:hendrix_tours_app/objects/theme_data.dart';
import 'package:hendrix_tours_app/services/firebase_service.dart';
import 'package:hendrix_tours_app/templates/main_page_template.dart';
import 'package:hendrix_tours_app/objects/widget_item.dart';

void main() async {
  // Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseService _firebaseService = FirebaseService();
  late Future<WidgetItem> _rootWidgetFuture;

  @override
  void initState() {
    super.initState();
    _rootWidgetFuture = _firebaseService.getPage('homepage');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WidgetItem>(
      future: _rootWidgetFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    Color.fromRGBO(245, 130, 42, 1)),
              ),
            ),
          );
        }

        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error_outline,
                    color: Color.fromRGBO(245, 130, 42, 1),
                    size: 60,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Error loading content',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${snapshot.error}',
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        }

        return MainPageTemplate(
          rootWidget: snapshot.data!,
          showBackButton: false,
        );
      },
    );
  }
}
