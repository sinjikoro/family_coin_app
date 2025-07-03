import 'package:flutter/material.dart';
import 'package:family_coin/presentation/ui/components/atoms/color_bar.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Green', type: ColorBar)
Widget colorBarGreenUseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16),
    child: ColorBar(color: Colors.green),
  );
}

@widgetbook.UseCase(name: 'Orange', type: ColorBar)
Widget colorBarOrangeUseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16),
    child: ColorBar(color: Colors.orange),
  );
}

@widgetbook.UseCase(name: 'Gray', type: ColorBar)
Widget colorBarGrayUseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16),
    child: ColorBar(color: Colors.grey),
  );
}
