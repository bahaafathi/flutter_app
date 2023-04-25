import 'package:flutter/material.dart';
import 'package:flutter_app/screens/home_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomeScreen', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

      expect(find.byType(ColoredBox), findsOneWidget);
      expect(find.byType(InkWell), findsOneWidget);
      expect(find.byType(Center), findsOneWidget);
      expect(find.byType(Text), findsOneWidget);
    });

    testWidgets('changes language on tap', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

      final textFinder = find.byType(Text);
      final initialText = tester.widget<Text>(textFinder).data;

      await tester.tap(find.byType(InkWell));
      await tester.pumpAndSettle();

      final newText = tester.widget<Text>(textFinder).data;

      expect(newText, isNot(initialText));
    });

    testWidgets('changes background color on timer',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

      final coloredBoxFinder = find.byType(ColoredBox);
      final initialColor = tester.widget<ColoredBox>(coloredBoxFinder).color;

      await tester.pump(const Duration(seconds: 3));

      final newColor = tester.widget<ColoredBox>(coloredBoxFinder).color;

      expect(newColor, isNot(initialColor));
    });
  });
}
