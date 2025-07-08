import 'package:flutter/material.dart';
import 'package:family_coin/presentation/ui/components/atoms/color_bar.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/utils/routing/route_path.dart';
import 'package:widgetbook/widgetbook.dart';

@widgetbook.UseCase(
  name: 'Interactive',
  type: ColorBar,
  path: WidgetbookRoutePath.atoms,
)
Widget colorBarInteractiveUseCase(BuildContext context) {
  final selectedColor = context.knobs.color(
    label: 'Color',
    description: 'カラーバーの色',
    initialValue: Colors.green,
  );

  return Center(child: ColorBar(color: selectedColor));
}
