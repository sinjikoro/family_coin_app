import 'package:flutter/material.dart';
import 'package:family_coin/presentation/ui/components/atoms/app_text_field.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/utils/routing/route_path.dart';
import 'package:widgetbook/widgetbook.dart';

const _default = 'Default';
const _name = 'Name';
const _amount = 'Amount';
const _description = 'Description';
const _url = 'URL';

@widgetbook.UseCase(
  name: 'Interactive',
  type: AppTextField,
  path: WidgetbookRoutePath.atoms,
)
Widget appTextFieldInteractiveUseCase(BuildContext context) {
  final fieldType = context.knobs.list(
    label: 'Field Type',
    description: 'テキストフィールドの種類',
    options: [_default, _name, _amount, _description, _url],
    initialOption: _default,
  );

  final enabled = context.knobs.boolean(
    label: 'Enabled',
    description: '有効/無効状態',
    initialValue: true,
  );

  final hintText = context.knobs.string(
    label: 'Hint Text',
    description: 'プレースホルダーテキスト',
    initialValue: '入力してください',
  );

  return Center(
    child: switch (fieldType) {
      _default => AppTextField(hintText: hintText, enabled: enabled),
      _name => AppTextField.name(enabled: enabled),
      _amount => AppTextField.amount(enabled: enabled),
      _description => AppTextField.description(enabled: enabled),
      _url => AppTextField.url(enabled: enabled),
      _ => AppTextField(hintText: hintText, enabled: enabled),
    },
  );
}
