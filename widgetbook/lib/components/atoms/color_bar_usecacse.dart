import 'package:flutter/material.dart';
import 'package:family_coin/presentation/ui/components/atoms/color_bar.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/utils/routing/route_path.dart';

@widgetbook.UseCase(
  name: 'Green',
  type: ColorBar,
  path: WidgetbookRoutePath.atoms,
)
Widget colorBarGreenUseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16),
    child: ColorBar(color: Colors.green),
  );
}

@widgetbook.UseCase(
  name: 'Orange',
  type: ColorBar,
  path: WidgetbookRoutePath.atoms,
)
Widget colorBarOrangeUseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16),
    child: ColorBar(color: Colors.orange),
  );
}

@widgetbook.UseCase(
  name: 'Gray',
  type: ColorBar,
  path: WidgetbookRoutePath.atoms,
)
Widget colorBarGrayUseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16),
    child: ColorBar(color: Colors.grey),
  );
}
