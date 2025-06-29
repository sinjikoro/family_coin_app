import 'package:family_coin/application/provider/transaction_log_list_state.dart';
import 'package:family_coin/application/usecase/task/complete_task_usecase.dart';
import 'package:family_coin/presentation/ui/components/organisms/account_card.dart';
import 'package:family_coin/presentation/ui/components/organisms/enable_task_list.dart';
import 'package:family_coin/presentation/ui/theme/spacing.dart';
import 'package:family_coin/presentation/util/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// タスク完了のユースケースプロバイダー
final completeTaskUseCaseProvider = Provider<CompleteTaskUseCase>(
  (ref) => CompleteTaskUseCase(
    transactionLogListState: ref.watch(
      transactionLogListStateProvider.notifier,
    ),
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
            child: Padding(
              padding: Spacing.screenPadding,
              child: PageView(children: const [AccountCard(), AccountCard()]),
            ),
          ),
          // 下部3/4: タスク一覧
          const Expanded(child: EnableTaskList()),
        ],
      ),
    ),
  );
}
