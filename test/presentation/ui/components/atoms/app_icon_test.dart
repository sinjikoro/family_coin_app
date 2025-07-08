import 'package:family_coin/presentation/ui/components/atoms/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppIcon', () {
    testWidgets('calendar icon displays correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: AppIcon(type: AppIconType.calendar, size: 24)),
        ),
      );

      expect(find.byType(AppIcon), findsOneWidget);
    });

    testWidgets('applies custom size', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: AppIcon(type: AppIconType.calendar, size: 32)),
        ),
      );

      final appIcon = tester.widget<AppIcon>(find.byType(AppIcon));
      expect(appIcon.size, 32);
    });

    testWidgets('applies custom color', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppIcon(
              type: AppIconType.calendar,
              size: 24,
              color: Colors.red,
            ),
          ),
        ),
      );

      final appIcon = tester.widget<AppIcon>(find.byType(AppIcon));
      expect(appIcon.color, Colors.red);
    });

    testWidgets('book icon displays correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: AppIcon(type: AppIconType.book, size: 24)),
        ),
      );

      expect(find.byType(AppIcon), findsOneWidget);
    });

    testWidgets('activity icon displays correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: AppIcon(type: AppIconType.activity, size: 24)),
        ),
      );

      expect(find.byType(AppIcon), findsOneWidget);
    });

    testWidgets('default icon with no image path', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: AppIcon(type: AppIconType.calendar, size: 24)),
        ),
      );

      expect(find.byType(AppIcon), findsOneWidget);
    });
  });
}
