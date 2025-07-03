import 'package:family_coin/presentation/ui/components/molecules/preview_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// プレビューセクション
class PreviewSection extends StatelessWidget {
  /// コンストラクタ
  const PreviewSection({
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.category,
    required this.coin,
    this.difficulty,
    this.chips,
    super.key,
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

  /// チップ
  final List<Widget>? chips;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'プレビュー',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      const SizedBox(height: 8),
      PreviewCard(
        title: title,
        subTitle: subTitle,
        icon: icon,
        category: category,
        difficulty: difficulty,
        coin: coin,
        chips: chips,
      ),
    ],
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
      ..add(IntProperty('coin', coin));
  }
}
