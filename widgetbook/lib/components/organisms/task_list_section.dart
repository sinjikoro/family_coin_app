import 'package:flutter/material.dart';
import 'package:family_coin/presentation/ui/components/organisms/task_list_section.dart';
import 'package:family_coin/presentation/ui/components/organisms/models/task_item_data.dart';
import 'package:family_coin/presentation/ui/components/atoms/app_icon.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Empty List', type: TaskListSection)
Widget taskListSectionEmptyUseCase(BuildContext context) {
  return const TaskListSection(
    tasks: [],
    emptyMessage: 'タスクがありません',
  );
}

@widgetbook.UseCase(name: 'Single Item', type: TaskListSection)
Widget taskListSectionSingleUseCase(BuildContext context) {
  return TaskListSection(
    tasks: const [
      TaskItemData(
        id: 'task_1',
        labelColor: Colors.blue,
        title: 'お手伝いをする',
        subTitle: '毎日',
        coin: 10,
        icon: AppIcon.heart(size: 32),
        isDone: false,
        isDisabled: false,
      ),
    ],
    onTaskToggle: (taskId) => debugPrint('Task toggled: $taskId'),
  );
}

@widgetbook.UseCase(name: 'Multiple Items', type: TaskListSection)
Widget taskListSectionMultipleUseCase(BuildContext context) {
  return TaskListSection(
    tasks: const [
      TaskItemData(
        id: 'task_1',
        labelColor: Colors.green,
        title: '宿題を完了する',
        subTitle: '算数・国語のワーク',
        coin: 50,
        icon: AppIcon.book(size: 32),
        isDone: true,
      ),
      TaskItemData(
        id: 'task_2',
        labelColor: Colors.orange,
        title: 'お手伝いをする',
        subTitle: '食器洗いのお手伝い',
        coin: 30,
        icon: AppIcon.heart(size: 32),
        isDone: false,
      ),
      TaskItemData(
        id: 'task_3',
        labelColor: Colors.blue,
        title: '早寝早起き',
        subTitle: '21時までに就寝',
        coin: 20,
        icon: AppIcon.settings(size: 32),
        isDone: false,
      ),
    ],
    onTaskToggle: (taskId) => debugPrint('Task toggled: $taskId'),
  );
}

@widgetbook.UseCase(name: 'With Disabled Items', type: TaskListSection)
Widget taskListSectionWithDisabledUseCase(BuildContext context) {
  return TaskListSection(
    tasks: const [
      TaskItemData(
        id: 'task_1',
        labelColor: Colors.blue,
        title: 'お手伝いをする',
        subTitle: '毎日',
        coin: 10,
        icon: AppIcon.heart(size: 32),
        isDone: false,
        isDisabled: false,
      ),
      TaskItemData(
        id: 'task_2',
        labelColor: Colors.grey,
        title: '無効なタスク',
        subTitle: '無効',
        coin: 5,
        icon: AppIcon.settings(size: 32),
        isDone: false,
        isDisabled: true,
      ),
    ],
    onTaskToggle: (taskId) => debugPrint('Task toggled: $taskId'),
  );
}
