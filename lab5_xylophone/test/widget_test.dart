// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:lab5_xylophone/main.dart';

void main() {
  testWidgets('Xylophone app has 7 colored keys', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const XylophoneApp());

    // Verify that we have 7 TextButton widgets (one for each xylophone key).
    expect(find.byType(TextButton), findsNWidgets(7));

    // Verify that we have a Column widget (containing the keys).
    expect(find.byType(Column), findsWidgets);

    // Verify that we have Expanded widgets (for equal height distribution).
    expect(find.byType(Expanded), findsNWidgets(7));
  });
}
