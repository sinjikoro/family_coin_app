import 'package:flutter/material.dart';
import 'package:family_coin/presentation/ui/components/atoms/progress_bar.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/utils/routing/route_path.dart';

@widgetbook.UseCase(
  name: 'Progress 0%',
  type: ProgressBar,
  path: WidgetbookRoutePath.atoms,
)
Widget progressBar0UseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16),
    child: ProgressBar(value: 0.0),
  );
}

@widgetbook.UseCase(
  name: 'Progress 50%',
  type: ProgressBar,
  path: WidgetbookRoutePath.atoms,
)
Widget progressBar50UseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16),
    child: ProgressBar(value: 0.5),
  );
}

@widgetbook.UseCase(
  name: 'Progress 100%',
  type: ProgressBar,
  path: WidgetbookRoutePath.atoms,
)
Widget progressBar100UseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16),
    child: ProgressBar(value: 1.0),
  );
}
