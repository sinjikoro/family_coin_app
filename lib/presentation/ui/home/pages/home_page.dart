import 'package:family_coin/application/provider/logged_in_user_state.dart';
import 'package:family_coin/application/provider/task_list_state.dart';
import 'package:family_coin/application/provider/task_log_list_state.dart';
import 'package:family_coin/application/provider/user_list_state.dart';
import 'package:family_coin/application/usecase/complete_task_usecase.dart';
import 'package:family_coin/core/extension/context_extension.dart';
import 'package:family_coin/presentation/ui/common/theme/spacing.dart';
import 'package:family_coin/presentation/ui/home/widgets/account_card.dart';
import 'package:family_coin/presentation/ui/home/widgets/enable_task_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// タスク完了のユースケースプロバイダー
final completeTaskUseCaseProvider = Provider<CompleteTaskUseCase>(
  (ref) => CompleteTaskUseCase(
    userState: ref.watch(userListStateProvider.notifier),
    taskLogListState: ref.watch(taskLogListStateProvider.notifier),
  ),
);

/// Home画面
class HomePage extends ConsumerStatefulWidget {
  /// Constructor
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      // await ref.read(loggedInUserStateProvider.notifier).fetchUser();
      await ref.read(taskListStateProvider.notifier).fetchTaskList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = ref.watch(loggedInUserStateProvider);
    final taskListProvider = ref.watch(taskListStateProvider);

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.homeTitle)),
      body: Column(
        children: [
          // 上部1/4: AccountCard
          SizedBox(
            height: context.screenHeight * 0.25,
            child: Padding(
              padding: Spacing.screenPadding,
              child: userProvider.when(
                data:
                    (user) => AccountCard(
                      name: user.name,
                      balance: user.familyCoinBalance.value,
                      nameOnChanged:
                          (name) async => await ref
                              .read(userListStateProvider.notifier)
                              .updateUserName(userId: user.id, name: name),
                    ),
                loading: () => const Center(child: CircularProgressIndicator()),
                error:
                    (error, stackTrace) => Center(child: Text('エラー: $error')),
              ),
            ),
          ),
          // 下部3/4: タスク一覧
          Expanded(
            child: taskListProvider.when(
              data:
                  (tasks) =>
                      tasks.isEmpty
                          ? const Center(child: Text('タスクがありません'))
                          : EnableTaskList(
                            tasks: tasks,
                            onTaskCompleted: (task) async {
                              await ref
                                  .read(completeTaskUseCaseProvider)
                                  .execute(
                                    user: userProvider.value!,
                                    task: task,
                                  );
                            },
                          ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) => Center(child: Text('エラー: $error')),
            ),
          ),
        ],
      ),
    );
  }
}
