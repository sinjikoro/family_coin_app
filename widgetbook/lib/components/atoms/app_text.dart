import 'package:flutter/material.dart';
import 'package:family_coin/presentation/ui/components/atoms/app_text.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: AppText)
Widget appTextDefaultUseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16),
    child: AppText(text: '標準テキスト'),
  );
}

@widgetbook.UseCase(name: 'LargeBold', type: AppText)
Widget appTextLargeBoldUseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16),
    child: AppText(text: '大きい太字', fontSize: 24, fontWeight: FontWeight.bold),
  );
}

@widgetbook.UseCase(name: 'Colored', type: AppText)
Widget appTextColoredUseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16),
    child: AppText(text: '色付き', color: Colors.blue),
  );
}
