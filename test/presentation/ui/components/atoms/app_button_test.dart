import 'package:family_coin/presentation/ui/components/atoms/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppButton', () {
    testWidgets('primary button displays correct label and responds to tap',
        (tester) async {
      var tapped = false;
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppButton.primary(
              label: 'Test Button',
              onPressed: () => tapped = true,
            ),
          ),
        ),
      );

      // ボタンが表示されていることを確認
      expect(find.text('Test Button'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);

      // タップイベントが動作することを確認
      await tester.tap(find.byType(ElevatedButton));
      expect(tapped, isTrue);
    });

    testWidgets('secondary button has correct styling', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppButton.secondary(
              label: 'Secondary',
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.text('Secondary'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
    });

    testWidgets('disabled button does not respond to tap', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppButton.disabled(
              label: 'Disabled',
            ),
          ),
        ),
      );

      expect(find.text('Disabled'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
      
      // 無効ボタンは onPressed が null なので実際のタップ動作をテストしない
      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      expect(button.onPressed, isNull);
    });

    testWidgets('button with custom padding', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppButton.primary(
              label: 'Custom Padding',
              onPressed: () {},
              padding: const EdgeInsets.all(20),
            ),
          ),
        ),
      );

      expect(find.text('Custom Padding'), findsOneWidget);
    });
  });
}