import 'package:flutter/material.dart';
import 'package:family_coin/presentation/ui/pages/task_setting_page.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/utils/routing/route_path.dart';

@widgetbook.UseCase(
  name: 'Default',
  type: TaskSettingPage,
  path: WidgetbookRoutePath.pages,
)
Widget taskSettingPageDefaultUseCase(BuildContext context) {
  return const TaskSettingPage();
}
