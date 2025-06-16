import 'package:family_coin/application/provider/active_user_state.dart';
import 'package:family_coin/application/provider/task_list_state.dart';
import 'package:family_coin/application/usecase/task/create_task_usecase.dart';
import 'package:family_coin/domain/model/task/task.dart';
import 'package:family_coin/domain/value_object/family_coin.dart';
import 'package:family_coin/presentation/routing/route_path.dart';
import 'package:family_coin/presentation/ui/common/widgets/tappable_editable_text.dart';
import 'package:family_coin/presentation/util/extension/context_extension.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// タスク一覧
class TaskListPage extends ConsumerStatefulWidget {
  /// constructor
  const TaskListPage({super.key});

  @override
  ConsumerState<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends ConsumerState<TaskListPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(context.l10n.taskListTitle)),
    body: RefreshIndicator(
      onRefresh:
          () async => await ref.read(taskListStateProvider.notifier).fetch(),
      child: ref
          .watch(taskListStateProvider)
          .when(
            data:
                (tasks) => ListView.builder(
                  itemCount: tasks.length + 1,
                  itemBuilder:
                      (context, index) =>
                          index < tasks.length
                              ? TaskRow(task: tasks[index])
                              : NewTaskRow(onChanged: _onNewTaskRowChanged),
                ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error:
                (error, stackTrace) =>
                    Center(child: Text(context.l10n.error(error.toString()))),
          ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () async => await context.push(RoutePath.taskCreate),
      child: const Icon(Icons.add),
    ),
  );

  /// 新規タスク行の変更
  Future<void> _onNewTaskRowChanged(String text) async {
    final activeUser = ref.read(activeUserStateProvider).value;
    if (activeUser == null) {
      return;
    }
    await CreateTaskUseCase(
      taskListState: ref.read(taskListStateProvider.notifier),
    ).execute(
      name: text,
      earnCoins: const FamilyCoin(0),
      userId: activeUser.userId,
    );
  }
}

/// タスク行
class TaskRow extends StatelessWidget {
  /// constructor
  const TaskRow({required this.task, super.key});

  /// タスク
  final Task task;

  @override
  Widget build(BuildContext context) => ListTile(
    title: Text(task.name),
    subtitle: Text(task.earnCoins.toString()),
    trailing: const Icon(Icons.arrow_forward_ios),
    onTap: () async => await context.push(RoutePath.taskDetail(task.taskId)),
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Task>('task', task));
  }
}

/// 新規タスク行
class NewTaskRow extends StatefulWidget {
  /// constructor
  const NewTaskRow({required this.onChanged, super.key});

  /// タスク名の変更
  final void Function(String) onChanged;

  @override
  State<NewTaskRow> createState() => _NewTaskRowState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      ObjectFlagProperty<void Function(String p1)>.has('onChanged', onChanged),
    );
  }
}

class _NewTaskRowState extends State<NewTaskRow> {
  @override
  Widget build(BuildContext context) => ListTile(
    title: TappableEditableText(text: 'New Task', onChanged: widget.onChanged),
  );
}
