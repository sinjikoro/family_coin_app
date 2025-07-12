import 'package:family_coin/presentation/ui/components/molecules/labeled_text_field.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/utils/routing/route_path.dart';
import 'package:widgetbook/widgetbook.dart';

@widgetbook.UseCase(
  name: 'Interactive',
  type: LabeledTextField,
  path: WidgetbookRoutePath.molecules,
)
Widget labeledTextFieldUseCase(BuildContext context) {
  final label = context.knobs.string(
    label: 'Label',
    description: 'ラベルテキスト',
    initialValue: '達成条件',
  );
  final hintText = context.knobs.string(
    label: 'Hint Text',
    description: 'ヒントテキスト',
    initialValue: '10回タスクを完了する',
  );

  final hasCallback = context.knobs.boolean(
    label: 'Has Callback',
    description: '変更時のコールバックを有効にする',
    initialValue: true,
  );

  return Center(
    child: LabeledTextField(
      label: label,
      hintText: hintText,
      onChanged: hasCallback ? (_) {} : null,
    ),
  );
}
