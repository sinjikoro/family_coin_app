import 'package:flutter/material.dart';
import 'package:family_coin/presentation/ui/components/atoms/arrow_up_icon.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: ArrowUpIcon)
Widget arrowUpIconDefaultUseCase(BuildContext context) {
  return const Padding(padding: EdgeInsets.all(16), child: ArrowUpIcon());
}

@widgetbook.UseCase(name: 'Large', type: ArrowUpIcon)
Widget arrowUpIconLargeUseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16),
    child: ArrowUpIcon(size: 32),
  );
}
