import 'package:family_coin/domain/value_object/avatar.dart';
import 'package:family_coin/presentation/ui/components/atoms/app_icon.dart';
import 'package:family_coin/presentation/ui/components/atoms/app_text.dart';
import 'package:family_coin/presentation/ui/components/organisms/models/progress_data.dart';
import 'package:family_coin/presentation/ui/components/organisms/models/task_item_data.dart';
import 'package:family_coin/presentation/ui/components/organisms/progress_card_section.dart';
import 'package:family_coin/presentation/ui/components/organisms/task_list_section.dart';
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

    // 進捗データの定義
    const todayProgress = ProgressData(
      icon: AppIcon(type: AppIconType.calendar, size: 24),
      title: '今日のタスク',
      valueText: '3/5 完了',
    );

    const weeklyProgress = ProgressData(
      icon: AppIcon(type: AppIconType.trophy, size: 24),
      title: '今週の進捗',
      valueText: '85%',
      progress: 0.85,
    );

    // タスクデータの定義
    final tasks = [
      const TaskItemData(
        id: 'task_1',
        labelColor: Colors.green,
        title: '宿題を完了する',
        subTitle: '算数・国語のワーク',
        coin: 50,
        isDone: true,
        icon: AppIcon(type: AppIconType.book, size: 32),
      ),
      const TaskItemData(
        id: 'task_2',
        labelColor: Colors.orange,
        title: 'お手伝いをする',
        subTitle: '食器洗いのお手伝い',
        coin: 30,
        icon: AppIcon(type: AppIconType.heart, size: 32),
      ),
      const TaskItemData(
        id: 'task_3',
        labelColor: Colors.grey,
        title: '早寝早起き',
        subTitle: '21時までに就寝',
        coin: 20,
        icon: AppIcon(type: AppIconType.settings, size: 32),
      ),
      const TaskItemData(
        id: 'task_4',
        labelColor: Colors.grey,
        title: '読書時間',
        subTitle: '30分間の読書',
        coin: 20,
        icon: AppIcon(type: AppIconType.book, size: 32),
      ),
    ];

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
              // 進捗カードセクション（レスポンシブ対応）
              const ProgressCardSection(
                todayProgress: todayProgress,
                weeklyProgress: weeklyProgress,
              ),
              // 「今日のタスク」タイトル
              const AppText.title(text: '今日のタスク'),
              // タスクリストセクション
              TaskListSection(tasks: tasks, onTaskToggle: _handleTaskToggle),
            ],
          ),
        ),
      ),
    );
  }

  /// タスクの完了状態切り替えハンドラー
  void _handleTaskToggle(String taskId) {
    // TODO: 実際の状態管理（Riverpod等）での実装
    // 現在はデモ用のスタブ
    debugPrint('Task toggled: $taskId');
  }
}
