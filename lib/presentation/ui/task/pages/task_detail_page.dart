import 'package:family_coin/application/provider/task_list_state.dart';
import 'package:family_coin/core/exception/exception.dart';
import 'package:family_coin/core/extension/context_extension.dart';
import 'package:family_coin/domain/model/task/task.dart';
import 'package:family_coin/domain/value_object/difficuly.dart';
import 'package:family_coin/domain/value_object/family_coin.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:family_coin/presentation/ui/task/widgets/task_form_widget.dart';
import 'package:family_coin/presentation/ui/task/widgets/task_read_only_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// タスク詳細
class TaskDetailPage extends ConsumerStatefulWidget {
  /// constructor
  const TaskDetailPage({required this.taskId, super.key});

  /// タスクID
  final Id taskId;

  @override
  ConsumerState<TaskDetailPage> createState() => _TaskDetailPageState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Id>('taskId', taskId));
  }
}

class _TaskDetailPageState extends ConsumerState<TaskDetailPage> {
  /// 編集モード
  bool isEditing = false;

  @override
  Widget build(BuildContext context) {
    final taskAsync = ref.watch(
      taskListStateProvider.select(
        (tasks) =>
            tasks.value?.firstWhere((task) => task.id == widget.taskId, orElse: () => throw Exception('タスクが見つかりません')),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(taskAsync?.name ?? ''),
        actions: [if (!isEditing) IconButton(icon: const Icon(Icons.edit), onPressed: toggleEditing)],
      ),
      body: _buildBody(taskAsync),
    );
  }

  /// 編集モードを切り替える
  void toggleEditing() => setState(() => isEditing = !isEditing);

  /// タスクを更新する
  Future<void> _updateTask({
    required String name,
    required String description,
    required FamilyCoin earnCoins,
    required Difficulty difficulty,
  }) async {
    try {
      await ref
          .read(taskListStateProvider.notifier)
          .updateTask(widget.taskId, name, description, earnCoins, difficulty);
      if (mounted) {
        toggleEditing();
      }
    } on NotLoggedInException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(context.l10n.error(e.toString()))));
      }
    }
  }

  /// ボディWidget
  Widget _buildBody(Task? task) {
    if (task == null) {
      return const Center(child: Text('タスクが見つかりません'));
    }

    if (isEditing) {
      return TaskFormWidget(task: task, onSave: _updateTask, onCancel: toggleEditing);
    }

    return TaskReadOnlyWidget(
      taskName: task.name,
      taskDescription: task.description,
      taskEarnCoins: task.earnCoins,
      taskDifficulty: task.difficulty,
      taskRegistrationStatus: task.registrationStatus,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<bool>('isEditing', isEditing));
  }
}
