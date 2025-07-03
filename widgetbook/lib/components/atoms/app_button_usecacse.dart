import 'package:flutter/material.dart';
import 'package:family_coin/presentation/ui/components/atoms/app_button.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/utils/routing/route_path.dart';

@widgetbook.UseCase(
  name: 'Primary',
  type: AppButton,
  path: WidgetbookRoutePath.atoms,
)
Widget primaryButtonUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: AppButton.primary(label: '保存', onPressed: () {}),
  );
}

@widgetbook.UseCase(
  name: 'Secondary',
  type: AppButton,
  path: WidgetbookRoutePath.atoms,
)
Widget secondaryButtonUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: AppButton.secondary(label: 'タスクを作成', onPressed: () {}),
  );
}

@widgetbook.UseCase(
  name: 'Disabled',
  type: AppButton,
  path: WidgetbookRoutePath.atoms,
)
Widget disabledButtonUseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16),
    child: AppButton.disabled(label: 'キャンセル'),
  );
}
