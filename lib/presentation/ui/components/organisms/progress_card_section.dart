import 'package:family_coin/presentation/ui/components/molecules/progress_card.dart';
import 'package:family_coin/presentation/ui/components/organisms/models/progress_data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// 進捗カードセクション（レスポンシブ対応）
/// 
/// 画面幅に応じて縦並び/横並びを切り替える進捗カードのセクション。
/// 狭い画面では縦に並べ、広い画面では横に並べる。
class ProgressCardSection extends StatelessWidget {
  /// コンストラクタ
  const ProgressCardSection({
    required this.todayProgress,
    required this.weeklyProgress,
    this.breakpoint = 400,
    super.key,
  });

  /// 今日の進捗データ
  final ProgressData todayProgress;

  /// 今週の進捗データ  
  final ProgressData weeklyProgress;

  /// レスポンシブ切り替えのブレークポイント（デフォルト400px）
  final double breakpoint;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) {
      // 画面幅が狭い場合は縦に並べる
      if (constraints.maxWidth < breakpoint) {
        return Column(
          children: [
            ProgressCard(
              icon: todayProgress.icon,
              title: todayProgress.title,
              valueText: todayProgress.valueText,
              progress: todayProgress.progress,
            ),
            const SizedBox(height: 12),
            ProgressCard(
              icon: weeklyProgress.icon,
              title: weeklyProgress.title,
              valueText: weeklyProgress.valueText,
              progress: weeklyProgress.progress,
            ),
          ],
        );
      }
      
      // 画面幅が広い場合は横に並べる
      return Row(
        children: [
          Expanded(
            child: ProgressCard(
              icon: todayProgress.icon,
              title: todayProgress.title,
              valueText: todayProgress.valueText,
              progress: todayProgress.progress,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: ProgressCard(
              icon: weeklyProgress.icon,
              title: weeklyProgress.title,
              valueText: weeklyProgress.valueText,
              progress: weeklyProgress.progress,
            ),
          ),
        ],
      );
    },
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<ProgressData>('todayProgress', todayProgress))
      ..add(DiagnosticsProperty<ProgressData>('weeklyProgress', weeklyProgress))
      ..add(DoubleProperty('breakpoint', breakpoint));
  }
}