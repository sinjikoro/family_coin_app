import 'package:family_coin/application/provider/task_log_list_state.dart';
import 'package:family_coin/application/usecase/task/complete_task_usecase.dart';
import 'package:family_coin/core/extension/context_extension.dart';
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
class HomePage extends StatelessWidget {
  /// Constructor
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
    child: Scaffold(
      body: Column(
        children: [
          // 上部1/4: AccountCard
          SizedBox(
            height: context.screenHeight * 0.25,
            child: const Padding(
              padding: Spacing.screenPadding,
              child: AccountCard(),
            ),
          ),
          // 下部3/4: タスク一覧
          const Expanded(child: EnableTaskList()),
        ],
      ),
    ),
  );
}
