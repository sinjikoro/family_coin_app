import 'package:flutter/material.dart';
import 'package:family_coin/presentation/ui/components/organisms/task_list_section.dart';
import 'package:family_coin/presentation/ui/components/molecules/task_list_item.dart';
import 'package:family_coin/presentation/ui/components/atoms/app_icon.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Empty List', type: TaskListSection)
Widget taskListSectionEmptyUseCase(BuildContext context) {
  return const TaskListSection(title: '今日のタスク', items: []);
}

@widgetbook.UseCase(name: 'Single Item', type: TaskListSection)
Widget taskListSectionSingleUseCase(BuildContext context) {
  return const TaskListSection(
    title: '今日のタスク',
    items: [
      TaskListItem(
        labelColor: Colors.blue,
        title: 'お手伝いをする',
        subTitle: '毎日',
        coin: 10,
        icon: AppIcon.bookOpen(size: 32),
        isDone: false,
        isDisabled: false,
      ),
    ],
  );
}

@widgetbook.UseCase(name: 'Multiple Items', type: TaskListSection)
Widget taskListSectionMultipleUseCase(BuildContext context) {
  return const TaskListSection(
    title: '今日のタスク',
    items: [
      TaskListItem(
        labelColor: Colors.blue,
        title: 'お手伝いをする',
        subTitle: '毎日',
        coin: 10,
        icon: AppIcon.bookOpen(size: 32),
        isDone: false,
        isDisabled: false,
      ),
      TaskListItem(
        labelColor: Colors.green,
        title: '宿題を終わらせる',
        subTitle: '完了済み',
        coin: 15,
        icon: AppIcon.book(size: 32),
        isDone: true,
        isDisabled: false,
      ),
      TaskListItem(
        labelColor: Colors.orange,
        title: '運動する',
        subTitle: '週3回',
        coin: 20,
        icon: AppIcon.star(size: 32),
        isDone: false,
        isDisabled: false,
      ),
    ],
  );
}

@widgetbook.UseCase(name: 'With Disabled Items', type: TaskListSection)
Widget taskListSectionWithDisabledUseCase(BuildContext context) {
  return const TaskListSection(
    title: '今日のタスク',
    items: [
      TaskListItem(
        labelColor: Colors.blue,
        title: 'お手伝いをする',
        subTitle: '毎日',
        coin: 10,
        icon: AppIcon.bookOpen(size: 32),
        isDone: false,
        isDisabled: false,
      ),
      TaskListItem(
        labelColor: Colors.grey,
        title: '無効なタスク',
        subTitle: '無効',
        coin: 5,
        icon: AppIcon.bookOpen(size: 32),
        isDone: false,
        isDisabled: true,
      ),
    ],
  );
}
