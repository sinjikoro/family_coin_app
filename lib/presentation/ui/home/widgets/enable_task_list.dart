import 'package:family_coin/domain/model/task/task.dart';
import 'package:family_coin/presentation/ui/common/theme/spacing.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

/// 有効なタスク一覧
class EnableTaskList extends StatelessWidget {
  /// constructor
  const EnableTaskList({
    required this.tasks,
    required this.onTaskCompleted,
    super.key,
  });

  /// タスク一覧
  final List<Task> tasks;

  /// タスク完了時のコールバック
  final Future<void> Function(Task) onTaskCompleted;

  @override
  Widget build(BuildContext context) => ListView.builder(
    padding: Spacing.screenPadding,
    itemCount: tasks.length,
    itemBuilder: (context, index) {
      final task = tasks[index];
      return Padding(
        padding: const EdgeInsets.only(bottom: Spacing.sm),
        child: Slidable(
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            extentRatio: 0.25,
            children: [
              SlidableAction(
                onPressed: (context) async => await onTaskCompleted(task),
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                icon: Icons.check,
                label: '完了',
              ),
            ],
          ),
          child: Card(
            child: Padding(
              padding: Spacing.listItemPadding,
              child: ListTile(
                title: Text(task.name),
                subtitle: Text(task.description),
                trailing: Text(task.earnCoins.value.toString()),
              ),
            ),
          ),
        ),
      );
    },
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(IterableProperty<Task>('tasks', tasks))
      ..add(
        ObjectFlagProperty<void Function(Task p1)>.has(
          'onTaskCompleted',
          onTaskCompleted,
        ),
      );
  }
}
