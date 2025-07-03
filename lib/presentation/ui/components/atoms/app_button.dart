import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// アプリ共通ボタン（primary, secondary, disabled対応）
class AppButton extends StatelessWidget {
  /// プライマリボタン
  const AppButton.primary({
    required this.label,
    required this.onPressed,
    this.padding,
    super.key,
  }) : _type = _AppButtonType.primary;

  /// セカンダリボタン
  const AppButton.secondary({
    required this.label,
    required this.onPressed,
    this.padding,
    super.key,
  }) : _type = _AppButtonType.secondary;

  /// 無効ボタン
  const AppButton.disabled({required this.label, this.padding, super.key})
    : onPressed = null,
      _type = _AppButtonType.disabled;

  /// ラベル
  final String label;

  /// ボタン押下時のコールバック
  final VoidCallback? onPressed;

  /// ボタンタイプ
  final _AppButtonType _type;

  /// パディング
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final style = _style(_type);
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _type == _AppButtonType.disabled ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: style.backgroundColor,
          foregroundColor: style.textColor,
          disabledBackgroundColor: style.backgroundColor,
          disabledForegroundColor: style.textColor,
          padding: padding ?? const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: style.textColor,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  _AppButtonStyle _style(_AppButtonType type) => switch (type) {
    _AppButtonType.primary => const _AppButtonStyle(
      backgroundColor: Color(0xFF111827), // 濃紺
      textColor: Colors.white,
    ),
    _AppButtonType.secondary => const _AppButtonStyle(
      backgroundColor: Color(0xFFF3F4F6), // 薄グレー
      textColor: Color(0xFF9CA3AF), // グレー
    ),
    _AppButtonType.disabled => const _AppButtonStyle(
      backgroundColor: Color(0xFFF3F4F6), // 薄グレー
      textColor: Color(0xFF9CA3AF), // グレー
    ),
  };

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('label', label))
      ..add(ObjectFlagProperty<VoidCallback?>.has('onPressed', onPressed))
      ..add(DiagnosticsProperty<EdgeInsetsGeometry?>('padding', padding));
  }
}

/// ボタンタイプ
enum _AppButtonType { primary, secondary, disabled }

class _AppButtonStyle {
  const _AppButtonStyle({
    required this.backgroundColor,
    required this.textColor,
  });
  final Color backgroundColor;
  final Color textColor;
}
