// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:hendrix_tours_app/main.dart';
import 'package:hendrix_tours_app/objects/info_view_item.dart';
import 'package:hendrix_tours_app/objects/list_view_item.dart';
import 'package:hendrix_tours_app/templates/main_page_template.dart';

void main() {

  testWidgets('Navigating between different pages', (WidgetTester tester) async {
    // Arrange: Making pages
    final leafPage = InfoViewItem(
      title: 'Leaf Page',
      description: 'Leaf page content',
      hasImage: false,
      connBuildings: [],
      connDepartments: [],
      link: '',
    );

    final middlePage = ListViewItem(
      title: 'Middle Page',
      child: [leafPage],
      hasImage: false,
      isListView: true,
      link: '',
    );

    final rootPage = ListViewItem(
      title: 'Root Page',
      child: [middlePage],
      hasImage: false,
      isListView: true,
      link: '',
    );

    await tester.pumpWidget(
      MaterialApp(
        home: MainPageTemplate(
          rootWidget: rootPage,
          showBackButton: true,
        ),
      ),
    );

    // Act: Navigate through the pages
    await tester.tap(find.text('Middle Page'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Leaf Page'));
    await tester.pumpAndSettle();

    // Assert
    expect(find.text('Leaf Page'), findsOneWidget);
    expect(find.text('Leaf page content'), findsOneWidget);
    expect(find.text('Back Home'), findsOneWidget);
    expect(find.byIcon(Icons.arrow_back), findsOneWidget);
  });

  testWidgets('Back Home works from all pages', (WidgetTester tester) async {
    // Arrange: Creating pages
    final leafPage = InfoViewItem(
      title: 'Leaf Page',
      description: 'Leaf page content',
      hasImage: false,
      connBuildings: [],
      connDepartments: [],
      link: '',
    );

    final middlePage = ListViewItem(
      title: 'Middle Page',
      child: [leafPage],
      hasImage: false,
      isListView: true,
      link: '',
    );

    final rootPage = ListViewItem(
      title: 'Root Page',
      child: [middlePage],
      hasImage: false,
      isListView: true,
      link: '',
    );

    await tester.pumpWidget(
      MaterialApp(
        home: MainPageTemplate(
          rootWidget: rootPage,
          showBackButton: true,
        ),
      ),
    );

    // Act: Navigate to deepest level
    await tester.tap(find.text('Middle Page'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Leaf Page'));
    await tester.pumpAndSettle();
    
    // Verify we're there
    expect(find.text('Leaf page content'), findsOneWidget);

    // Click 'Back Home'
    await tester.tap(find.text('Back Home'));
    await tester.pumpAndSettle();

    // Assert
    expect(find.text('Root Page'), findsOneWidget);
    expect(find.text('Middle Page'), findsOneWidget);
    expect(find.text('Back Home'), findsNothing);
    expect(find.text('Leaf Page'), findsNothing);

  });

  // Would add a Firebase test but not sure how to implement that
}
