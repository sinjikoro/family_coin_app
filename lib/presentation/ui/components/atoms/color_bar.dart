import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// 縦色バー
class ColorBar extends StatelessWidget {
  /// コンストラクタ
  const ColorBar({
    required this.color,
    super.key,
    this.height = 40,
    this.width = 4,
  });

  /// バーの色
  final Color color;

  /// バーの高さ
  final double height;

  /// バーの幅
  final double width;

  @override
  Widget build(BuildContext context) => Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(width / 2),
    ),
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(ColorProperty('color', color))
      ..add(DoubleProperty('height', height))
      ..add(DoubleProperty('width', width));
  }
}
