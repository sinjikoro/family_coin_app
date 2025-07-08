import 'package:flutter/material.dart';
import 'package:family_coin/presentation/ui/components/atoms/tappable_editable_text.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/utils/routing/route_path.dart';
import 'package:widgetbook/widgetbook.dart';

@widgetbook.UseCase(
  name: 'Interactive',
  type: TappableEditableText,
  path: WidgetbookRoutePath.atoms,
)
Widget tappableEditableTextInteractiveUseCase(BuildContext context) {
  final text = context.knobs.string(
    label: 'Text',
    description: '表示・編集するテキスト',
    initialValue: 'タップして編集',
  );

  final showCallback = context.knobs.boolean(
    label: 'disabled',
    description: 'コールバックを無効にする',
    initialValue: false,
  );

  return Center(
    child: TappableEditableText(
      text: text,
      onChanged: showCallback ? null : (value) {},
    ),
  );
}
