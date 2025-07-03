import 'package:family_coin/presentation/ui/components/atoms/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppIcon', () {
    testWidgets('displays icon correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppIcon(Icons.home),
          ),
        ),
      );

      expect(find.byIcon(Icons.home), findsOneWidget);
    });

    testWidgets('applies custom size', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppIcon(
              Icons.star,
              size: 32,
            ),
          ),
        ),
      );

      final iconWidget = tester.widget<Icon>(find.byIcon(Icons.star));
      expect(iconWidget.size, 32);
    });

    testWidgets('applies custom color', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppIcon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
        ),
      );

      final iconWidget = tester.widget<Icon>(find.byIcon(Icons.favorite));
      expect(iconWidget.color, Colors.red);
    });

    testWidgets('uses semantic label when provided', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppIcon(
              Icons.settings,
              semanticLabel: 'Settings icon',
            ),
          ),
        ),
      );

      final iconWidget = tester.widget<Icon>(find.byIcon(Icons.settings));
      expect(iconWidget.semanticLabel, 'Settings icon');
    });

    testWidgets('small variant has correct size', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppIcon.small(Icons.check),
          ),
        ),
      );

      final iconWidget = tester.widget<Icon>(find.byIcon(Icons.check));
      expect(iconWidget.size, 16);
    });

    testWidgets('medium variant has correct size', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppIcon.medium(Icons.check),
          ),
        ),
      );

      final iconWidget = tester.widget<Icon>(find.byIcon(Icons.check));
      expect(iconWidget.size, 24);
    });

    testWidgets('large variant has correct size', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppIcon.large(Icons.check),
          ),
        ),
      );

      final iconWidget = tester.widget<Icon>(find.byIcon(Icons.check));
      expect(iconWidget.size, 32);
    });
  });
}