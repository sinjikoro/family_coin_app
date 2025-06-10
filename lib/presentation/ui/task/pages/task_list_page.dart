import 'package:family_coin/application/provider/task_list_state.dart';
import 'package:family_coin/core/extension/context_extension.dart';
import 'package:family_coin/presentation/routing/route_path.dart';
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
  Widget build(BuildContext context) {
    final taskListAsync = ref.watch(taskListStateProvider);

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.taskListTitle)),
      body: RefreshIndicator(
        onRefresh:
            () async => await ref.read(taskListStateProvider.notifier).fetch(),
        child: taskListAsync.when(
          data:
              (tasks) => ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return ListTile(
                    title: Text(task.name),
                    subtitle: Text(task.earnCoins.toString()),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap:
                        () async => await context.push(
                          RoutePath.taskDetail(task.taskId),
                        ),
                  );
                },
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
  }
}
