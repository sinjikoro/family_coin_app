import 'package:flutter/material.dart';
import 'package:family_coin/presentation/ui/components/atoms/check_circle_icon.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: CheckCircleIcon)
Widget checkCircleIconDefaultUseCase(BuildContext context) {
  return const Padding(padding: EdgeInsets.all(16), child: CheckCircleIcon());
}
