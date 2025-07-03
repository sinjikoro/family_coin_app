import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// 進捗バー
class ProgressBar extends StatelessWidget {
  /// コンストラクタ
  const ProgressBar({
    required this.value,
    super.key,
    this.height = 8,
    this.color,
  });

  /// 進捗率（0.0〜1.0）
  final double value;

  /// バーの高さ
  final double height;

  /// バーの色
  final Color? color;

  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: BorderRadius.circular(height / 2),
    child: LinearProgressIndicator(
      value: value,
      minHeight: height,
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      valueColor: AlwaysStoppedAnimation<Color>(
        color ?? Theme.of(context).colorScheme.primary,
      ),
    ),
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DoubleProperty('value', value))
      ..add(DoubleProperty('height', height))
      ..add(ColorProperty('color', color));
  }
}
