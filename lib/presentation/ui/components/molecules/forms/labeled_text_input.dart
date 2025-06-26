import 'package:family_coin/presentation/ui/components/atoms/inputs/app_text_field.dart';
import 'package:family_coin/presentation/ui/components/atoms/text/app_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// ラベル付きテキスト入力（Molecule）
class LabeledTextInput extends StatelessWidget {
  /// Constructor
  const LabeledTextInput({
    required this.label,
    this.controller,
    this.validator,
    this.keyboardType,
    this.maxLines = 1,
    this.hintText,
    this.inputFormatters,
    this.onChanged,
    super.key,
  });

  /// ラベル
  final String label;

  /// テキストコントローラー
  final TextEditingController? controller;

  /// バリデーター
  final String? Function(String?)? validator;

  /// キーボードタイプ
  final TextInputType? keyboardType;

  /// 最大行数
  final int maxLines;

  /// ヒントテキスト
  final String? hintText;

  /// 入力フォーマッター
  final List<TextInputFormatter>? inputFormatters;

  /// テキスト変更時のコールバック
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      AppText.caption(label),
      const SizedBox(height: 8),
      AppTextField(
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        maxLines: maxLines,
        hintText: hintText,
        inputFormatters: inputFormatters,
        onChanged: onChanged,
      ),
    ],
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('label', label))
      ..add(StringProperty('hintText', hintText))
      ..add(IntProperty('maxLines', maxLines));
  }
}