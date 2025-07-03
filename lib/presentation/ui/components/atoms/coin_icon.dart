import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// コインのアイコン
class CoinIcon extends StatelessWidget {
  /// コンストラクタ
  const CoinIcon({super.key, this.size = 40, this.color});

  /// アイコンサイズ
  final double size;

  /// アイコン色
  final Color? color;

  @override
  Widget build(BuildContext context) => Icon(
    Icons.monetization_on,
    size: size,
    color: color ?? Theme.of(context).colorScheme.primary,
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DoubleProperty('size', size))
      ..add(ColorProperty('color', color));
  }
}
