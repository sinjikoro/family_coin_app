import 'package:flutter/material.dart';
import 'package:family_coin/presentation/ui/components/atoms/app_button.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/utils/routing/route_path.dart';

//  ボタンの種類
const _primary = 'primary';
const _secondary = 'secondary';
const _disabled = 'disabled';

@widgetbook.UseCase(
  name: 'Primary',
  type: AppButton,
  path: WidgetbookRoutePath.atoms,
)
Widget primaryButtonUseCase(BuildContext context) {
  final buttonType = context.knobs.list(
    label: 'buttonType',
    options: [_primary, _secondary, _disabled],
  );

  return Center(
    child: switch (buttonType) {
      _primary => AppButton.primary(label: '保存', onPressed: () {}),
      _secondary => AppButton.secondary(label: 'タスクを作成', onPressed: () {}),
      _disabled => AppButton.disabled(label: 'キャンセル'),
      String() => throw UnimplementedError(),
    },
  );
}
