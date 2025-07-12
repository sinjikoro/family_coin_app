import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// 凡例アイテム
class LegendItem {
  /// コンストラクタ
  const LegendItem({
    required this.color,
    required this.label,
    this.borderColor,
    this.borderWidth,
  });

  /// 色
  final Color color;

  /// ラベル
  final String label;

  /// 境界線の色
  final Color? borderColor;

  /// 境界線の太さ
  final double? borderWidth;
}

/// 凡例行
class LegendRow extends StatelessWidget {
  /// constructor
  const LegendRow({
    required this.items,
    super.key,
    this.spacing = 16,
    this.iconSize = 20,
    this.iconBorderRadius = 4,
  });

  /// 凡例アイテムリスト
  final List<LegendItem> items;

  /// アイテム間のスペース
  final double spacing;

  /// アイコンサイズ
  final double iconSize;

  /// アイコンの角丸
  final double iconBorderRadius;

  @override
  Widget build(BuildContext context) => Row(
    children: items
        .expand((item) => [
              Container(
                width: iconSize,
                height: iconSize,
                decoration: BoxDecoration(
                  color: item.color,
                  border: item.borderColor != null
                      ? Border.all(
                          color: item.borderColor!,
                          width: item.borderWidth ?? 2,
                        )
                      : null,
                  borderRadius: BorderRadius.circular(iconBorderRadius),
                ),
              ),
              const SizedBox(width: 4),
              Text(item.label),
              if (item != items.last) SizedBox(width: spacing),
            ])
        .toList(),
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(IterableProperty<LegendItem>('items', items))
      ..add(DoubleProperty('spacing', spacing))
      ..add(DoubleProperty('iconSize', iconSize))
      ..add(DoubleProperty('iconBorderRadius', iconBorderRadius));
  }
}