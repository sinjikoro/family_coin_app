import 'package:flutter/material.dart';
import 'package:family_coin/presentation/ui/components/atoms/app_fab.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/utils/routing/route_path.dart';

@widgetbook.UseCase(
  name: 'Default',
  type: AppFab,
  path: WidgetbookRoutePath.atoms,
)
Widget appFabUseCase(BuildContext context) {
  return const Center(child: AppFab(label: '新しいタスク', onTap: null));
}

@widgetbook.UseCase(
  name: 'With Callback',
  type: AppFab,
  path: WidgetbookRoutePath.atoms,
)
Widget appFabWithCallbackUseCase(BuildContext context) {
  return Center(
    child: AppFab(
      label: '新しいタスク',
      onTap: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('FAB tapped!')));
      },
    ),
  );
}
