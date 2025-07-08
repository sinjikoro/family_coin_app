import 'package:family_coin/presentation/ui/components/atoms/app_text_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// 達成条件入力フィールド
class AchievementConditionField extends StatelessWidget {

  /// constructor
  const AchievementConditionField({
    required this.condition, required this.onChanged, super.key,
  });
  /// 達成条件テキスト
  final String condition;

  /// 達成条件変更コールバック
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text('達成条件'),
      AppTextField(
        hintText: '例: 補助輪なしで10メートル以上乗れること',
        onChanged: onChanged,
        textAlign: TextAlign.left,
      ),
    ],
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('condition', condition));
    properties.add(ObjectFlagProperty<ValueChanged<String>>.has('onChanged', onChanged));
  }
}