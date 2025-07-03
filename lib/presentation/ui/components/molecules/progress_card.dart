import 'package:family_coin/presentation/ui/components/atoms/app_icon.dart';
import 'package:family_coin/presentation/ui/components/atoms/app_text.dart';
import 'package:family_coin/presentation/ui/components/atoms/progress_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// 進捗カード
class ProgressCard extends StatelessWidget {
  /// コンストラクタ
  const ProgressCard({
    required this.icon,
    required this.title,
    required this.valueText,
    super.key,
    this.subText,
    this.progress,
  });

  /// アイコン
  final AppIcon icon;

  /// タイトル
  final String title;

  /// メイン数値
  final String valueText;

  /// サブテキスト
  final String? subText;

  /// 進捗率（0.0〜1.0, nullならバー非表示）
  final double? progress;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 400;

    // 固定高さを設定（進捗バーの有無に関係なく統一）
    final cardHeight = isSmallScreen ? 100.0 : 120.0;

    return Container(
      height: cardHeight,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 上部：アイコンとタイトル
          Row(
            children: [
              icon,
              SizedBox(width: isSmallScreen ? 6 : 8),
              Expanded(
                child: AppText(
                  text: title,
                  fontWeight: FontWeight.bold,
                  fontSize: isSmallScreen ? 14 : 16,
                  maxLines: 1,
                ),
              ),
            ],
          ),
          // 下部：数値テキスト、サブテキスト、または進捗バー
          if (progress != null) ...[
            // 進捗バーがある場合：数値テキストを上部に、進捗バーを下部に
            Row(
              children: [
                const Spacer(),
                AppText(
                  text: valueText,
                  fontWeight: FontWeight.bold,
                  fontSize: isSmallScreen ? 18 : 20,
                  color: theme.colorScheme.primary,
                ),
              ],
            ),
            ProgressBar(value: progress!),
          ] else ...[
            // 進捗バーがない場合：数値テキストを下部に配置
            Row(
              children: [
                const Spacer(),
                AppText(
                  text: valueText,
                  fontWeight: FontWeight.bold,
                  fontSize: isSmallScreen ? 18 : 20,
                  color: theme.colorScheme.primary,
                ),
              ],
            ),
          ],
          if (subText != null) ...[
            AppText(
              text: subText!,
              fontSize: isSmallScreen ? 12 : 13,
              color: theme.hintColor,
            ),
          ],
        ],
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<AppIcon>('icon', icon))
      ..add(StringProperty('title', title))
      ..add(StringProperty('valueText', valueText))
      ..add(StringProperty('subText', subText))
      ..add(DoubleProperty('progress', progress));
  }
}
