import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// プレビューカード
class PreviewCard extends StatelessWidget {
  /// コンストラクタ
  const PreviewCard({
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.category,
    required this.coin,
    super.key,
    this.difficulty,
    this.backgroundColor,
    this.chips,
  });

  /// タイトル
  final String title;

  /// サブタイトル
  final String subTitle;

  /// アイコン
  final IconData icon;

  /// カテゴリ
  final String category;

  /// 難易度
  final String? difficulty;

  /// コイン
  final int coin;

  /// 背景色
  final Color? backgroundColor;

  /// チップ
  final List<Widget>? chips;

  @override
  Widget build(BuildContext context) => Card(
    color: backgroundColor ?? Colors.yellow[50],
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 32, color: Colors.orange),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    subTitle,
                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                '$coin コイン',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: [
              Chip(label: Text(category)),
              if (difficulty != null) Chip(label: Text(difficulty!)),
              ...?chips,
            ],
          ),
        ],
      ),
    ),
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('title', title))
      ..add(StringProperty('subTitle', subTitle))
      ..add(DiagnosticsProperty<IconData>('icon', icon))
      ..add(StringProperty('category', category))
      ..add(StringProperty('difficulty', difficulty))
      ..add(IntProperty('coin', coin))
      ..add(ColorProperty('backgroundColor', backgroundColor));
  }
}
