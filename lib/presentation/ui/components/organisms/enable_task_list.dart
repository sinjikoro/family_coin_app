import 'package:family_coin/application/provider/active_user_state.dart';
import 'package:family_coin/application/provider/task_list_state.dart';
import 'package:family_coin/application/provider/transaction_log_list_state.dart';
import 'package:family_coin/application/usecase/task/complete_task_usecase.dart';
import 'package:family_coin/domain/model/task/task.dart';
import 'package:family_coin/presentation/ui/theme/spacing.dart';
import 'package:family_coin/presentation/util/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

/// 有効なタスク一覧
class EnableTaskList extends ConsumerWidget {
  /// constructor
  const EnableTaskList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => FutureBuilder(
    future: ref.watch(taskListStateProvider.future),
    builder: (context, asyncTasks) {
      switch (asyncTasks.connectionState) {
        case ConnectionState.done:
          if (asyncTasks.hasData) {
            final tasks = asyncTasks.data!;
            return ListView.builder(
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
                          onPressed:
                              (context) async =>
                                  await _onTaskCompleted(ref, task),
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          icon: Icons.check,
                          label: context.l10n.taskDone,
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
          } else {
            return Center(child: Text(context.l10n.errorNotFoundData));
          }

        case ConnectionState.waiting:
        case ConnectionState.none:
        case ConnectionState.active:
          return const Center(child: CircularProgressIndicator());
      }
    },
  );

  /// タスク完了時のコールバック
  Future<void> _onTaskCompleted(WidgetRef ref, Task task) async {
    // ログイン中のユーザー取得
    final activeUser = await ref.read(activeUserStateProvider.future);
    if (activeUser == null) return;
    // タスク完了
    await CompleteTaskUseCase(
      transactionLogListState: ref.read(
        transactionLogListStateProvider.notifier,
      ),
    ).execute(user: activeUser, task: task);
    // ユーザー情報を更新
    await ref.read(activeUserStateProvider.notifier).refresh();
  }
}
