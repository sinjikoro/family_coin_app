import 'package:flutter/material.dart';
import 'package:family_coin/presentation/ui/components/atoms/app_text.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/utils/routing/route_path.dart';

@widgetbook.UseCase(
  name: 'Default',
  type: AppText,
  path: WidgetbookRoutePath.atoms,
)
Widget appTextDefaultUseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16),
    child: AppText(text: '標準テキスト'),
  );
}

@widgetbook.UseCase(
  name: 'LargeBold',
  type: AppText,
  path: WidgetbookRoutePath.atoms,
)
Widget appTextLargeBoldUseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16),
    child: AppText(text: '大きい太字', fontSize: 24, fontWeight: FontWeight.bold),
  );
}

@widgetbook.UseCase(
  name: 'Colored',
  type: AppText,
  path: WidgetbookRoutePath.atoms,
)
Widget appTextColoredUseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16),
    child: AppText(text: '色付き', color: Colors.blue),
  );
}
