import 'package:family_coin/presentation/ui/components/molecules/task_list_item.dart';
import 'package:family_coin/presentation/ui/components/organisms/models/task_item_data.dart';
import 'package:family_coin/presentation/ui/theme/spacing.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// タスクリストセクション
/// 
/// スクロール可能なタスクリストを表示するOrganism。
/// タスクの状態変更をコールバックで通知する。
class TaskListSection extends StatelessWidget {
  /// コンストラクタ
  const TaskListSection({
    required this.tasks,
    this.onTaskToggle,
    this.emptyMessage = 'タスクがありません',
    super.key,
  });

  /// 表示するタスクリスト
  final List<TaskItemData> tasks;

  /// タスクの完了状態切り替え時のコールバック
  final ValueChanged<String>? onTaskToggle;

  /// 空状態の時のメッセージ
  final String emptyMessage;

  @override
  Widget build(BuildContext context) {
    if (tasks.isEmpty) {
      return Expanded(
        child: Center(
          child: Text(
            emptyMessage,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      );
    }

    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...tasks.map(
              (task) => Padding(
                padding: const EdgeInsets.only(bottom: Spacing.s),
                child: TaskListItem(
                  labelColor: task.labelColor,
                  title: task.title,
                  subTitle: task.subTitle,
                  coin: task.coin,
                  isDone: task.isDone,
                  icon: task.icon,
                  isDisabled: task.isDisabled,
                  onTap: onTaskToggle != null && !task.isDisabled
                      ? () => onTaskToggle!(task.id)
                      : null,
                ),
              ),
            ),
            // リスト末尾の余白
            const SizedBox(height: Spacing.m),
          ],
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(IterableProperty<TaskItemData>('tasks', tasks))
      ..add(ObjectFlagProperty<ValueChanged<String>?>.has(
        'onTaskToggle',
        onTaskToggle,
      ))
      ..add(StringProperty('emptyMessage', emptyMessage));
  }
}