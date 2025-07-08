import 'package:flutter/material.dart';
import 'package:family_coin/presentation/ui/components/molecules/task_list_item.dart';
import 'package:family_coin/presentation/ui/components/atoms/app_icon.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: TaskListItem)
Widget taskListItemUseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16),
    child: TaskListItem(
      labelColor: Colors.blue,
      title: 'お手伝いをする',
      subTitle: '毎日',
      coin: 10,
      icon: AppIcon(type: AppIconType.bookOpen, size: 32),
      isDone: false,
      isDisabled: false,
    ),
  );
}

@widgetbook.UseCase(name: 'Completed', type: TaskListItem)
Widget taskListItemCompletedUseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16),
    child: TaskListItem(
      labelColor: Colors.green,
      title: '宿題を終わらせる',
      subTitle: '完了済み',
      coin: 15,
      icon: AppIcon(type: AppIconType.bookOpen, size: 32),
      isDone: true,
      isDisabled: false,
    ),
  );
}

@widgetbook.UseCase(name: 'Disabled', type: TaskListItem)
Widget taskListItemDisabledUseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16),
    child: TaskListItem(
      labelColor: Colors.grey,
      title: '無効なタスク',
      subTitle: '無効',
      coin: 5,
      icon: AppIcon(type: AppIconType.bookOpen, size: 32),
      isDone: false,
      isDisabled: true,
    ),
  );
}

@widgetbook.UseCase(name: 'With Callback', type: TaskListItem)
Widget taskListItemWithCallbackUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: TaskListItem(
      labelColor: Colors.purple,
      title: 'タップ可能なタスク',
      subTitle: 'タップしてください',
      coin: 20,
      icon: AppIcon(type: AppIconType.bookOpen, size: 32),
      isDone: false,
      isDisabled: false,
      onTap: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Task item tapped!')));
      },
    ),
  );
}
