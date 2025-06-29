import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// シンプルな中央寄せテキストフィールド（例: 宿題をする）
class AppTextField extends StatelessWidget {
  /// 共通コンストラクタ
  const AppTextField({
    this.controller,
    this.hintText = '例: 宿題をする',
    this.enabled = true,
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.inputFormatters,
    this.obscureText = false,
    super.key,
  });

  /// 名前用
  factory AppTextField.name({
    Key? key,
    TextEditingController? controller,
    String? hintText,
    bool enabled = true,
    void Function(String)? onChanged,
  }) {
    return AppTextField(
      key: key,
      controller: controller,
      hintText: hintText ?? '例: 田中太郎',
      enabled: enabled,
      onChanged: onChanged,
      keyboardType: TextInputType.text,
      maxLines: 1,
    );
  }

  /// 金額用
  factory AppTextField.amount({
    Key? key,
    TextEditingController? controller,
    String? hintText,
    bool enabled = true,
    void Function(String)? onChanged,
  }) {
    return AppTextField(
      key: key,
      controller: controller,
      hintText: hintText ?? '例: 1000',
      enabled: enabled,
      onChanged: onChanged,
      keyboardType: TextInputType.number,
      maxLines: 1,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    );
  }

  /// 説明用
  factory AppTextField.description({
    Key? key,
    TextEditingController? controller,
    String? hintText,
    bool enabled = true,
    void Function(String)? onChanged,
  }) {
    return AppTextField(
      key: key,
      controller: controller,
      hintText: hintText ?? '例: お小遣いの用途',
      enabled: enabled,
      onChanged: onChanged,
      keyboardType: TextInputType.multiline,
      maxLines: 5,
    );
  }

  /// URL用
  factory AppTextField.url({
    Key? key,
    TextEditingController? controller,
    String? hintText,
    bool enabled = true,
    void Function(String)? onChanged,
  }) {
    return AppTextField(
      key: key,
      controller: controller,
      hintText: hintText ?? '例: https://example.com',
      enabled: enabled,
      onChanged: onChanged,
      keyboardType: TextInputType.url,
      maxLines: 1,
    );
  }

  /// コントローラー
  final TextEditingController? controller;

  /// ヒントテキスト
  final String hintText;

  /// 有効フラグ
  final bool enabled;

  /// 変更時のコールバック
  final void Function(String)? onChanged;

  /// キーボード種別
  final TextInputType keyboardType;

  /// 最大行数
  final int maxLines;

  /// 入力フォーマッタ
  final List<TextInputFormatter>? inputFormatters;

  /// パスワード用
  final bool obscureText;

  @override
  Widget build(BuildContext context) => TextField(
    controller: controller,
    enabled: enabled,
    onChanged: onChanged,
    textAlign: TextAlign.center,
    style: const TextStyle(
      color: Color(0xFF9CA3AF), // グレー
      fontSize: 20,
      fontWeight: FontWeight.normal,
    ),
    keyboardType: keyboardType,
    maxLines: maxLines,
    inputFormatters: inputFormatters,
    obscureText: obscureText,
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(
        color: Color(0xFF9CA3AF), // グレー
        fontSize: 20,
        fontWeight: FontWeight.normal,
      ),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(vertical: 18),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Color(0xFFE5E7EB), // 薄いグレー
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Color(0xFFE5E7EB), // 薄いグレー
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Color(0xFFE5E7EB), // 薄いグレー
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Color(0xFFE5E7EB), // 薄いグレー
        ),
      ),
    ),
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('hintText', hintText))
      ..add(DiagnosticsProperty<bool>('enabled', enabled))
      ..add(DiagnosticsProperty<TextInputType>('keyboardType', keyboardType))
      ..add(IntProperty('maxLines', maxLines))
      ..add(
        DiagnosticsProperty<List<TextInputFormatter>?>(
          'inputFormatters',
          inputFormatters,
        ),
      )
      ..add(
        FlagProperty(
          'obscureText',
          value: obscureText,
          ifTrue: 'obscure',
          ifFalse: 'not obscure',
        ),
      )
      ..add(
        ObjectFlagProperty<void Function(String p1)?>.has(
          'onChanged',
          onChanged,
        ),
      )
      ..add(
        DiagnosticsProperty<TextEditingController?>('controller', controller),
      );
  }
}
