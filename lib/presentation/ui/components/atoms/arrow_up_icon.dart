import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// 上向き矢印アイコン（増加値用）
class ArrowUpIcon extends StatelessWidget {
  /// コンストラクタ
  const ArrowUpIcon({super.key, this.size = 18, this.color});

  /// アイコンサイズ
  final double size;

  /// アイコン色
  final Color? color;

  @override
  Widget build(BuildContext context) =>
      Icon(Icons.arrow_upward, size: size, color: color ?? Colors.green);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DoubleProperty('size', size))
      ..add(ColorProperty('color', color));
  }
}
