import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// 選択肢チップ（単一・複数選択対応）
class AppChoiceChip extends StatelessWidget {
  /// コンストラクタ
  /// 単一選択
  const AppChoiceChip({
    required this.label,
    required this.selected,
    required this.onSelected,
    super.key,
    this.padding,
    this.width,
  });

  /// ラベル
  final String label;

  /// 選択状態
  final bool selected;

  /// 選択時のコールバック
  final ValueChanged<bool> onSelected;

  /// パディング
  final EdgeInsetsGeometry? padding;

  /// 幅
  final double? width;

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        selected ? const Color(0xFF111827) : const Color(0xFFF3F4F6);
    final textColor = selected ? Colors.white : const Color(0xFF9CA3AF);
    return Padding(
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: SizedBox(
        width: width,
        child: Material(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(24),
          child: InkWell(
            borderRadius: BorderRadius.circular(24),
            onTap: () => onSelected(!selected),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              alignment: Alignment.center,
              child: Text(
                label,
                style: TextStyle(
                  color: textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('label', label))
      ..add(DiagnosticsProperty<bool>('selected', selected))
      ..add(
        ObjectFlagProperty<ValueChanged<bool>>.has('onSelected', onSelected),
      )
      ..add(DiagnosticsProperty<EdgeInsetsGeometry?>('padding', padding))
      ..add(DoubleProperty('width', width));
  }
}
