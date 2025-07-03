import 'package:family_coin/presentation/ui/components/atoms/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppText', () {
    testWidgets('displays text correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppText('Test Text'),
          ),
        ),
      );

      expect(find.text('Test Text'), findsOneWidget);
    });

    testWidgets('heading1 has correct style', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppText.heading1('Heading 1'),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Heading 1'));
      expect(textWidget.style?.fontSize, 32);
      expect(textWidget.style?.fontWeight, FontWeight.bold);
    });

    testWidgets('heading2 has correct style', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppText.heading2('Heading 2'),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Heading 2'));
      expect(textWidget.style?.fontSize, 24);
      expect(textWidget.style?.fontWeight, FontWeight.bold);
    });

    testWidgets('heading3 has correct style', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppText.heading3('Heading 3'),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Heading 3'));
      expect(textWidget.style?.fontSize, 20);
      expect(textWidget.style?.fontWeight, FontWeight.w600);
    });

    testWidgets('body has correct style', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppText.body('Body text'),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Body text'));
      expect(textWidget.style?.fontSize, 16);
      expect(textWidget.style?.fontWeight, FontWeight.normal);
    });

    testWidgets('caption has correct style', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppText.caption('Caption text'),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Caption text'));
      expect(textWidget.style?.fontSize, 12);
      expect(textWidget.style?.fontWeight, FontWeight.normal);
    });

    testWidgets('supports custom text alignment', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppText(
              'Centered text',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Centered text'));
      expect(textWidget.textAlign, TextAlign.center);
    });

    testWidgets('supports maxLines', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppText(
              'Text with max lines',
              maxLines: 2,
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Text with max lines'));
      expect(textWidget.maxLines, 2);
    });

    testWidgets('supports overflow', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppText(
              'Text with overflow',
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Text with overflow'));
      expect(textWidget.overflow, TextOverflow.ellipsis);
    });
  });
}