import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// タブ切替用ボタン
class AppTabButton extends StatelessWidget {
  /// コンストラクタ
  const AppTabButton({
    required this.label,
    required this.selected,
    super.key,
    this.onTap,
  });

  /// ラベル
  final String label;

  /// 選択状態
  final bool selected;

  /// タップ時コールバック
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color:
              selected
                  ? theme.colorScheme.primary.withValues(alpha: 0.1)
                  : Colors.transparent,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: selected ? theme.colorScheme.primary : theme.dividerColor,
            width: selected ? 2 : 1,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color:
                selected
                    ? theme.colorScheme.primary
                    : theme.textTheme.bodyMedium?.color,
            fontWeight: FontWeight.bold,
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
      ..add(ObjectFlagProperty<VoidCallback?>.has('onTap', onTap));
  }
}
