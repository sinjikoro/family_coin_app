import 'package:flutter/material.dart';
import 'package:family_coin/presentation/ui/components/atoms/app_tab_button.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/utils/routing/route_path.dart';
import 'package:widgetbook/widgetbook.dart';

@widgetbook.UseCase(
  name: 'Interactive',
  type: AppTabButton,
  path: WidgetbookRoutePath.atoms,
)
Widget appTabButtonInteractiveUseCase(BuildContext context) {
  final label = context.knobs.string(
    label: 'Label',
    description: 'タブボタンのラベル',
    initialValue: 'タブボタン',
  );

  final selected = context.knobs.boolean(
    label: 'Selected',
    description: '選択状態',
    initialValue: false,
  );

  final hasCallback = context.knobs.boolean(
    label: 'Has Callback',
    description: 'タップ時のコールバックを有効にする',
    initialValue: true,
  );

  return Center(
    child: AppTabButton(
      label: label,
      selected: selected,
      onTap: hasCallback ? () {} : null,
    ),
  );
}
