import 'package:family_coin/application/provider/logged_in_user_state.dart';
import 'package:family_coin/application/provider/task_list_state.dart';
import 'package:family_coin/application/provider/task_log_list_state.dart';
import 'package:family_coin/application/usecase/task/complete_task_usecase.dart';
import 'package:family_coin/application/usecase/user/update_user_name_usecase.dart';
import 'package:family_coin/core/extension/context_extension.dart';
import 'package:family_coin/domain/model/task/task.dart';
import 'package:family_coin/presentation/ui/common/theme/spacing.dart';
import 'package:family_coin/presentation/ui/home/widgets/account_card.dart';
import 'package:family_coin/presentation/ui/home/widgets/enable_task_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// タスク完了のユースケースプロバイダー
final completeTaskUseCaseProvider = Provider<CompleteTaskUseCase>(
  (ref) => CompleteTaskUseCase(
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
                      onNameChanged: _onNameChanged,
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
                            onTaskCompleted: _onTaskCompleted,
                          ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) => Center(child: Text('エラー: $error')),
            ),
          ),
        ],
      ),
    );
  }

  /// 名前変更時のコールバック
  Future<void> _onNameChanged(String name) async {
    // ログイン中のユーザー取得
    final loggedInUser = ref.read(loggedInUserStateProvider);
    // 名前変更
    await const UpdateUserNameUseCase().execute(
      userId: loggedInUser.value!.id,
      name: name,
    );
    if (mounted) {
      // ユーザー情報を更新
      await ref.read(loggedInUserStateProvider.notifier).refresh();
    }
  }

  /// タスク完了時のコールバック
  Future<void> _onTaskCompleted(Task task) async {
    // ログイン中のユーザー取得
    final loggedInUser = ref.read(loggedInUserStateProvider);
    // タスク完了
    await CompleteTaskUseCase(
      taskLogListState: ref.read(taskLogListStateProvider.notifier),
    ).execute(user: loggedInUser.value!, task: task);
    if (mounted) {
      // ユーザー情報を更新
      await ref.read(loggedInUserStateProvider.notifier).refresh();
    }
  }
}
