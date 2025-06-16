import 'package:family_coin/application/provider/task_list_state.dart';
import 'package:family_coin/application/usecase/task/delete_task_usecase.dart';
import 'package:family_coin/application/usecase/task/get_task_usecase.dart';
import 'package:family_coin/application/usecase/task/update_task_usecase.dart';
import 'package:family_coin/domain/model/task/task.dart';
import 'package:family_coin/domain/value_object/difficuly.dart';
import 'package:family_coin/domain/value_object/family_coin.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:family_coin/presentation/ui/common/pages/error_page.dart';
import 'package:family_coin/presentation/ui/task/widgets/task_form_widget.dart';
import 'package:family_coin/presentation/util/extension/context_extension.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// タスク詳細ページ
class TaskDetailPage extends StatelessWidget {
  /// constructor
  const TaskDetailPage({required this.taskId, super.key});

  /// タスクID
  final TaskId taskId;

  @override
  Widget build(BuildContext context) => FutureBuilder<Task>(
    future: const GetTaskUseCase().execute(taskId: taskId),
    builder: (context, task) {
      switch (task.connectionState) {
        case ConnectionState.done:
          return task.hasData
              ? _TaskDetailPage(task: task.data!)
              : ErrorPage(errorMessage: context.l10n.errorUnexpected);
        case ConnectionState.waiting:
        case ConnectionState.none:
        case ConnectionState.active:
          return const Center(child: CircularProgressIndicator());
      }
    },
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<TaskId>('taskId', taskId));
  }
}

class _TaskDetailPage extends ConsumerStatefulWidget {
  /// constructor
  const _TaskDetailPage({required this.task});

  /// タスク
  final Task task;

  @override
  ConsumerState<_TaskDetailPage> createState() => _TaskDetailPageState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Task>('task', task));
  }
}

class _TaskDetailPageState extends ConsumerState<_TaskDetailPage> {
  /// 編集モード
  bool isEditing = false;
  Task _currentTask = Task.initial(const UserId.unassigned());

  @override
  void initState() {
    super.initState();
    _currentTask = widget.task;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(_currentTask.name),
      actions: [
        if (!isEditing)
          IconButton(icon: const Icon(Icons.delete), onPressed: _deleteTask),
      ],
    ),
    body: TaskFormWidget(task: _currentTask, onSave: _updateTask),
  );

  /// タスクを削除する
  Future<void> _deleteTask() async {
    final taskListState = ref.read(taskListStateProvider.notifier);
    await DeleteTaskUseCase(
      taskListState: taskListState,
    ).execute(taskId: widget.task.taskId);
    if (mounted) {
      context.pop();
    }
  }

  /// タスクを更新する
  Future<void> _updateTask({
    required String name,
    required String description,
    required FamilyCoin earnCoins,
    required Difficulty difficulty,
  }) async {
    final updatedTask = widget.task.copyWith(
      name: name,
      description: description,
      earnCoins: earnCoins,
      difficulty: difficulty,
    );
    await UpdateTaskUseCase(
      taskListState: ref.read(taskListStateProvider.notifier),
    ).execute(task: updatedTask);
    if (mounted) {
      context.pop();
    }
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<bool>('isEditing', isEditing));
  }
}
