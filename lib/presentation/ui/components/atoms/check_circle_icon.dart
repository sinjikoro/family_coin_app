import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// 完了用チェックアイコン
class CheckCircleIcon extends StatelessWidget {
  /// コンストラクタ
  const CheckCircleIcon({super.key, this.size = 28});

  /// サイズ
  final double size;

  @override
  Widget build(BuildContext context) =>
      Icon(Icons.check_circle, size: size, color: Colors.green);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('size', size));
  }
}
