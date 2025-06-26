import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// アプリケーション用テキスト入力フィールド（Atom）
class AppTextField extends StatelessWidget {
  /// Constructor
  const AppTextField({
    this.controller,
    this.labelText,
    this.hintText,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.maxLines = 1,
    this.enabled = true,
    this.obscureText = false,
    this.onChanged,
    this.onSubmitted,
    this.inputFormatters,
    super.key,
  });

  /// テキストコントローラー
  final TextEditingController? controller;

  /// ラベルテキスト
  final String? labelText;

  /// ヒントテキスト
  final String? hintText;

  /// バリデーター
  final String? Function(String?)? validator;

  /// キーボードタイプ
  final TextInputType? keyboardType;

  /// テキスト入力アクション
  final TextInputAction? textInputAction;

  /// 最大行数
  final int maxLines;

  /// 有効フラグ
  final bool enabled;

  /// パスワード表示フラグ
  final bool obscureText;

  /// テキスト変更時のコールバック
  final ValueChanged<String>? onChanged;

  /// 送信時のコールバック
  final ValueChanged<String>? onSubmitted;

  /// 入力フォーマッター
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) => TextFormField(
    controller: controller,
    validator: validator,
    keyboardType: keyboardType,
    textInputAction: textInputAction,
    maxLines: maxLines,
    enabled: enabled,
    obscureText: obscureText,
    onChanged: onChanged,
    onFieldSubmitted: onSubmitted,
    inputFormatters: inputFormatters,
    decoration: InputDecoration(
      labelText: labelText,
      hintText: hintText,
      border: const OutlineInputBorder(),
    ),
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('labelText', labelText))
      ..add(StringProperty('hintText', hintText))
      ..add(IntProperty('maxLines', maxLines))
      ..add(FlagProperty('enabled', value: enabled, ifFalse: 'disabled'))
      ..add(FlagProperty('obscureText', value: obscureText, ifTrue: 'obscured'));
  }
}