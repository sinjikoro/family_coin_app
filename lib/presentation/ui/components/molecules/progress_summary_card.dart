import 'package:family_coin/presentation/ui/components/atoms/app_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// 進捗サマリーカード
class ProgressSummaryCard extends StatelessWidget {
  /// コンストラクタ
  const ProgressSummaryCard({
    required this.title,
    required this.valueText,
    required this.subText,
    required this.color,
    super.key,
  });

  /// タイトル（例: 完了/残り）
  final String title;

  /// メイン数値（例: 3タスク）
  final String valueText;

  /// サブテキスト（例: 130コイン獲得）
  final String subText;

  /// カード色
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: color.withValues(alpha: 0.12),
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: color.withValues(alpha: 0.3)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: title,
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: color,
        ),
        const SizedBox(height: 4),
        AppText(
          text: valueText,
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: color,
        ),
        const SizedBox(height: 2),
        AppText(text: subText, fontSize: 13, color: color),
      ],
    ),
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('title', title))
      ..add(StringProperty('valueText', valueText))
      ..add(StringProperty('subText', subText))
      ..add(ColorProperty('color', color));
  }
}
