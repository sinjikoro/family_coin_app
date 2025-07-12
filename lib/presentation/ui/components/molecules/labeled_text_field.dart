import 'package:family_coin/presentation/ui/components/atoms/app_text_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// ラベル付きテキストフィールド
class LabeledTextField extends StatelessWidget {
  /// constructor
  const LabeledTextField({
    required this.label,
    required this.hintText,
    this.onChanged,
    this.controller,
    this.textAlign = TextAlign.left,
    super.key,
  });

  /// ラベルテキスト
  final String label;

  /// ヒントテキスト
  final String hintText;

  /// 変更コールバック
  final ValueChanged<String>? onChanged;

  /// コントローラー
  final TextEditingController? controller;

  /// テキストアライン
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label),
      AppTextField(
        controller: controller,
        hintText: hintText,
        onChanged: onChanged,
        enabled: onChanged != null,
        textAlign: textAlign,
      ),
    ],
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('label', label))
      ..add(StringProperty('hintText', hintText))
      ..add(
        ObjectFlagProperty<ValueChanged<String>?>.has('onChanged', onChanged),
      )
      ..add(
        DiagnosticsProperty<TextEditingController?>('controller', controller),
      )
      ..add(EnumProperty<TextAlign>('textAlign', textAlign));
  }
}
