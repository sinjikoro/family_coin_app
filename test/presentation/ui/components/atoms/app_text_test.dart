import 'package:family_coin/presentation/ui/components/atoms/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppText', () {
    testWidgets('displays text correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppText(text: 'Test Text'),
          ),
        ),
      );

      expect(find.text('Test Text'), findsOneWidget);
    });

    testWidgets('title has correct style', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppText.title(text: 'Title Text'),
          ),
        ),
      );

      expect(find.text('Title Text'), findsOneWidget);
      final appText = tester.widget<AppText>(find.byType(AppText));
      expect(appText.fontSize, 20);
      expect(appText.fontWeight, FontWeight.w700);
    });

    testWidgets('xLarge has correct style', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppText.xLarge(text: 'XLarge Text'),
          ),
        ),
      );

      expect(find.text('XLarge Text'), findsOneWidget);
      final appText = tester.widget<AppText>(find.byType(AppText));
      expect(appText.fontSize, 40);
      expect(appText.fontWeight, FontWeight.w700);
    });

    testWidgets('large has correct style', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppText.large(text: 'Large Text'),
          ),
        ),
      );

      expect(find.text('Large Text'), findsOneWidget);
      final appText = tester.widget<AppText>(find.byType(AppText));
      expect(appText.fontSize, 24);
      expect(appText.fontWeight, FontWeight.w700);
    });

    testWidgets('supports custom text alignment', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppText(
              text: 'Centered text',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );

      final appText = tester.widget<AppText>(find.byType(AppText));
      expect(appText.textAlign, TextAlign.center);
    });

    testWidgets('supports maxLines', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppText(
              text: 'Text with max lines',
              maxLines: 2,
            ),
          ),
        ),
      );

      final appText = tester.widget<AppText>(find.byType(AppText));
      expect(appText.maxLines, 2);
    });

    testWidgets('supports custom color', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppText(
              text: 'Colored text',
              color: Colors.red,
            ),
          ),
        ),
      );

      final appText = tester.widget<AppText>(find.byType(AppText));
      expect(appText.color, Colors.red);
    });
  });
}