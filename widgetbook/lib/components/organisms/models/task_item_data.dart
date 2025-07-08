import 'package:flutter/material.dart';
import 'package:family_coin/presentation/ui/components/organisms/models/task_item_data.dart';
import 'package:family_coin/presentation/ui/components/atoms/app_icon.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Basic Task Item', type: TaskItemData)
Widget taskItemDataBasicUseCase(BuildContext context) {
  const taskData = TaskItemData(
    id: 'task_1',
    labelColor: Colors.blue,
    title: 'お手伝いをする',
    subTitle: '食器洗いのお手伝い',
    coin: 30,
    icon: AppIcon(type: AppIconType.heart, size: 32),
    isDone: false,
  );

  return Card(
    child: ListTile(
      leading: Container(
        width: 4,
        height: 40,
        decoration: BoxDecoration(
          color: taskData.labelColor,
          borderRadius: BorderRadius.circular(2),
        ),
      ),
      title: Text(taskData.title),
      subtitle: Text(taskData.subTitle),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          taskData.icon,
          const SizedBox(width: 8),
          Text('${taskData.coin}コイン'),
          const SizedBox(width: 8),
          Icon(
            taskData.isDone ? Icons.check_circle : Icons.circle_outlined,
            color: taskData.isDone ? Colors.green : Colors.grey,
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Completed Task', type: TaskItemData)
Widget taskItemDataCompletedUseCase(BuildContext context) {
  const taskData = TaskItemData(
    id: 'task_2',
    labelColor: Colors.green,
    title: '宿題を完了する',
    subTitle: '算数・国語のワーク',
    coin: 50,
    icon: AppIcon(type: AppIconType.book, size: 32),
    isDone: true,
  );

  return Card(
    child: ListTile(
      leading: Container(
        width: 4,
        height: 40,
        decoration: BoxDecoration(
          color: taskData.labelColor,
          borderRadius: BorderRadius.circular(2),
        ),
      ),
      title: Text(
        taskData.title,
        style: TextStyle(
          decoration: taskData.isDone ? TextDecoration.lineThrough : null,
          color: taskData.isDone ? Colors.grey : null,
        ),
      ),
      subtitle: Text(taskData.subTitle),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          taskData.icon,
          const SizedBox(width: 8),
          Text('${taskData.coin}コイン'),
          const SizedBox(width: 8),
          Icon(
            taskData.isDone ? Icons.check_circle : Icons.circle_outlined,
            color: taskData.isDone ? Colors.green : Colors.grey,
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Disabled Task', type: TaskItemData)
Widget taskItemDataDisabledUseCase(BuildContext context) {
  const taskData = TaskItemData(
    id: 'task_3',
    labelColor: Colors.grey,
    title: '無効なタスク',
    subTitle: '無効',
    coin: 5,
    icon: AppIcon(type: AppIconType.settings, size: 32),
    isDone: false,
    isDisabled: true,
  );

  return Card(
    child: ListTile(
      leading: Container(
        width: 4,
        height: 40,
        decoration: BoxDecoration(
          color: taskData.labelColor,
          borderRadius: BorderRadius.circular(2),
        ),
      ),
      title: Text(
        taskData.title,
        style: TextStyle(color: taskData.isDisabled ? Colors.grey : null),
      ),
      subtitle: Text(taskData.subTitle),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Opacity(
            opacity: taskData.isDisabled ? 0.5 : 1.0,
            child: taskData.icon,
          ),
          const SizedBox(width: 8),
          Text('${taskData.coin}コイン'),
          const SizedBox(width: 8),
          Icon(Icons.block, color: Colors.grey),
        ],
      ),
    ),
  );
}
