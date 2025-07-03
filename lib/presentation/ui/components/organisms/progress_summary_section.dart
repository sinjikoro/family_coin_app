import 'package:family_coin/presentation/ui/components/atoms/app_text.dart';
import 'package:family_coin/presentation/ui/components/molecules/progress_summary_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// 進捗サマリーセクション
class ProgressSummarySection extends StatelessWidget {
  /// コンストラクタ
  const ProgressSummarySection({
    required this.doneCount,
    required this.remainCount,
    required this.totalCount,
    required this.doneCoin,
    required this.remainCoin,
    super.key,
  });

  /// 完了タスク数
  final int doneCount;

  /// 残りタスク数
  final int remainCount;

  /// 合計タスク数
  final int totalCount;

  /// 完了コイン
  final int doneCoin;

  /// 残りコイン
  final int remainCoin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AppText(
                text: '今日の進捗',
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              AppText(
                text: '$doneCount/$totalCount 完了',
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: theme.colorScheme.primary,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: ProgressSummaryCard(
                  title: '完了',
                  valueText: '$doneCountタスク',
                  subText: '$doneCoinコイン獲得',
                  color: Colors.green,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ProgressSummaryCard(
                  title: '残り',
                  valueText: '$remainCountタスク',
                  subText: '$remainCoinコイン予定',
                  color: Colors.orange,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(IntProperty('doneCount', doneCount))
      ..add(IntProperty('remainCount', remainCount))
      ..add(IntProperty('totalCount', totalCount))
      ..add(IntProperty('doneCoin', doneCoin))
      ..add(IntProperty('remainCoin', remainCoin));
  }
}
