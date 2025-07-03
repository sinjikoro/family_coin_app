import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// 新しいタスクを追加するためのFAB
class AppFab extends StatelessWidget {
  /// コンストラクタ
  const AppFab({required this.label, super.key, this.onTap});

  /// ラベル
  final String label;

  /// タップ時コールバック
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 56,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.colorScheme.onInverseSurface,
          foregroundColor: theme.colorScheme.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          elevation: 2,
        ),
        icon: const Icon(Icons.add, size: 28),
        label: Text(
          label,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        onPressed: onTap,
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('label', label))
      ..add(ObjectFlagProperty<VoidCallback?>.has('onTap', onTap));
  }
}
