import 'package:family_coin/presentation/ui/components/atoms/app_icon.dart';
import 'package:family_coin/presentation/ui/components/atoms/app_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// 値表示カード
class ValueDisplayCard extends StatelessWidget {
  /// コンストラクタ
  const ValueDisplayCard({
    required this.icon,
    required this.value,
    super.key,
    this.changeValue,
    this.changeIcon,
    this.changeColor,
  });

  /// アイコン
  final AppIcon icon;

  /// メイン値
  final String value;

  /// 増減値
  final String? changeValue;

  /// 増減アイコン
  final AppIcon? changeIcon;

  /// 増減値の色
  final Color? changeColor;

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.onInverseSurface,
      borderRadius: BorderRadius.circular(24),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
    child: Row(
      children: [
        icon,
        const SizedBox(width: 20),
        Expanded(
          child: AppText(
            text: value,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (changeValue != null) ...[
          if (changeIcon != null) ...[
            changeIcon!,
            const SizedBox(width: 4),
          ],
          AppText(
            text: changeValue!,
            fontSize: 18,
            color: changeColor ?? Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ],
      ],
    ),
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<AppIcon>('icon', icon))
      ..add(StringProperty('value', value))
      ..add(StringProperty('changeValue', changeValue))
      ..add(DiagnosticsProperty<AppIcon?>('changeIcon', changeIcon))
      ..add(ColorProperty('changeColor', changeColor));
  }
}
