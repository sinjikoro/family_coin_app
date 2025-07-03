import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// 未完了用サークルアイコン
class CircleIcon extends StatelessWidget {
  /// コンストラクタ
  const CircleIcon({super.key, this.size = 28});

  /// サイズ
  final double size;

  @override
  Widget build(BuildContext context) =>
      Icon(Icons.radio_button_unchecked, size: size, color: Colors.grey);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('size', size));
  }
}
