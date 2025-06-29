import 'package:flutter/material.dart';
import 'package:family_coin/presentation/ui/components/atoms/app_button.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Primary', type: AppButton)
Widget primaryButtonUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: AppButton.primary(label: '保存', onPressed: () {}),
  );
}

@widgetbook.UseCase(name: 'Secondary', type: AppButton)
Widget secondaryButtonUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: AppButton.secondary(label: 'タスクを作成', onPressed: () {}),
  );
}

@widgetbook.UseCase(name: 'Disabled', type: AppButton)
Widget disabledButtonUseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16),
    child: AppButton.disabled(label: 'キャンセル'),
  );
}
