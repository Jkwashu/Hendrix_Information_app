// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:hendrix_tours_app/main.dart';

void main() {

  testWidgets('Navigating between different pages', (WidgetTester tester) async {
    await tester.binding.setSurfaceSize(const Size(1080, 2340));

    await tester.pumpWidget(const MyApp());
    expect(find.text('Hendrix Tours'), findsOneWidget);

    await tester.tap(find.text('Food and Housing'));
    await tester.pumpAndSettle();
    expect(find.text('The Caf'), findsOneWidget);
    
    await tester.tap(find.text('Back to Home'));
    await tester.pumpAndSettle();
    expect(find.text('Food and Housing'), findsOneWidget);
  });

  testWidgets('Back to Home works from all pages', (WidgetTester tester) async {
    await tester.binding.setSurfaceSize(const Size(1080, 2340));
    await tester.pumpWidget(const MyApp());

    for (final page in ['Food and Housing', 'Athletics', 'Student Life']) {
      await tester.tap(find.text(page));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Back to Home'));  
      await tester.pumpAndSettle();
      expect(find.text('Academics'), findsOneWidget);
    }
  });

  // testWidgets('External link test 1', callback)

  // testWidgets('Test for web based API feature', callback)
}
