import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// 設定（歯車）アイコン
class SettingsIcon extends StatelessWidget {
  /// コンストラクタ
  const SettingsIcon({super.key, this.size = 24, this.color});

  /// アイコンサイズ
  final double size;

  /// アイコン色
  final Color? color;

  @override
  Widget build(BuildContext context) => Icon(
    Icons.settings,
    size: size,
    color: color ?? Theme.of(context).iconTheme.color,
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DoubleProperty('size', size))
      ..add(ColorProperty('color', color));
  }
}
