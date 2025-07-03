import 'package:family_coin/domain/value_object/avatar.dart';
import 'package:family_coin/presentation/ui/components/atoms/app_icon.dart';
import 'package:family_coin/presentation/ui/components/atoms/app_text.dart';
import 'package:family_coin/presentation/ui/components/molecules/progress_card.dart';
import 'package:family_coin/presentation/ui/components/molecules/task_list_item.dart';
import 'package:family_coin/presentation/ui/components/organisms/user_info_card.dart';
import 'package:family_coin/presentation/ui/theme/spacing.dart';
import 'package:flutter/material.dart';

// active_user_state
// task_log (今日の消化分、今週の進捗)
// task_list（今日のタスク）
// task_complete_usecase

/// Home画面
class HomePage extends StatelessWidget {
  /// Constructor
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surfaceContainerLow,
      body: SafeArea(
        child: Padding(
          padding: Spacing.paddingPage,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: Spacing.m,
            children: [
              // ユーザー情報＋コイン残高カード
              const UserInfoCard(
                userName: 'たろうくん',
                subText: '今日もがんばろう！',
                avatar: AvatarNone(),
                balance: 1250,
                diff: 50,
              ),
              // 進捗カード2つ
              LayoutBuilder(
                builder: (context, constraints) {
                  // 画面幅が狭い場合は縦に並べる
                  if (constraints.maxWidth < 400) {
                    return const Column(
                      children: [
                        ProgressCard(
                          icon: AppIcon.calendar(size: 24),
                          title: '今日のタスク',
                          valueText: '3/5 完了',
                        ),
                        SizedBox(height: 12),
                        ProgressCard(
                          icon: AppIcon.trophy(size: 24),
                          title: '今週の進捗',
                          valueText: '85%',
                          progress: 0.85,
                        ),
                      ],
                    );
                  }
                  // 画面幅が広い場合は横に並べる
                  return const Row(
                    children: [
                      Expanded(
                        child: ProgressCard(
                          icon: AppIcon.calendar(size: 28),
                          title: '今日のタスク',
                          valueText: '3/5 完了',
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: ProgressCard(
                          icon: AppIcon.trophy(size: 28),
                          title: '今週の進捗',
                          valueText: '85%',
                          progress: 0.85,
                        ),
                      ),
                    ],
                  );
                },
              ),
              // 「今日のタスク」タイトル
              const AppText.title(text: '今日のタスク'),
              // タスクリスト
              const Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: Spacing.s,
                    children: [
                      TaskListItem(
                        labelColor: Colors.green,
                        title: '宿題を完了する',
                        subTitle: '算数・国語のワーク',
                        coin: 50,
                        isDone: true,
                        icon: AppIcon.book(size: 32),
                        isDisabled: false,
                      ),
                      TaskListItem(
                        labelColor: Colors.orange,
                        title: 'お手伝いをする',
                        subTitle: '食器洗いのお手伝い',
                        coin: 30,
                        isDone: false,
                        icon: AppIcon.heart(size: 32),
                        isDisabled: false,
                      ),
                      TaskListItem(
                        labelColor: Colors.grey,
                        title: '早寝早起き',
                        subTitle: '21時までに就寝',
                        coin: 20,
                        isDone: false,
                        icon: AppIcon.settings(size: 32),
                        isDisabled: false,
                      ),
                      TaskListItem(
                        labelColor: Colors.grey,
                        title: '早寝早起き',
                        subTitle: '21時までに就寝',
                        coin: 20,
                        isDone: false,
                        icon: AppIcon.settings(size: 32),
                        isDisabled: false,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
