import 'package:flutter/material.dart';
import 'package:family_coin/presentation/ui/components/atoms/app_text.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/utils/routing/route_path.dart';
import 'package:widgetbook/widgetbook.dart';

@widgetbook.UseCase(
  name: 'Interactive',
  type: AppText,
  path: WidgetbookRoutePath.atoms,
)
Widget appTextInteractiveUseCase(BuildContext context) {
  final text = context.knobs.string(
    label: 'Text',
    description: '表示するテキスト',
    initialValue: 'サンプルテキスト',
  );

  final fontSize = context.knobs.double.slider(
    label: 'Font Size',
    description: 'フォントサイズ',
    initialValue: 16.0,
    min: 4.0,
    max: 64.0,
    divisions: 15,
  );

  final fontBold = context.knobs.boolean(
    label: 'Font Bold',
    description: '太字',
    initialValue: false,
  );

  final color = context.knobs.color(
    label: 'Color',
    description: 'テキストの色',
    initialValue: Colors.black,
  );

  return Center(
    child: AppText(
      text: text,
      fontSize: fontSize,
      fontWeight: fontBold ? FontWeight.bold : FontWeight.normal,
      color: color,
    ),
  );
}
