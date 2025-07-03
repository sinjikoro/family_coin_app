import 'package:flutter/material.dart';
import 'package:family_coin/presentation/ui/pages/home_page.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/utils/routing/route_path.dart';

@widgetbook.UseCase(
  name: 'HomePage',
  type: HomePage,
  path: WidgetbookRoutePath.pages,
)
Widget homePageUseCase(BuildContext context) {
  return const Padding(padding: EdgeInsets.all(16), child: HomePage());
}
