import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// プライマリボタン（Atom）
class PrimaryButton extends StatelessWidget {
  /// Constructor
  const PrimaryButton({
    required this.onPressed,
    required this.child,
    this.isLoading = false,
    super.key,
  });

  /// ボタン押下時のコールバック
  final VoidCallback? onPressed;

  /// ボタンの子ウィジェット
  final Widget child;

  /// ローディング状態
  final bool isLoading;

  @override
  Widget build(BuildContext context) => ElevatedButton(
    onPressed: isLoading ? null : onPressed,
    child: isLoading
        ? const SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(strokeWidth: 2),
          )
        : child,
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(ObjectFlagProperty<VoidCallback?>.has('onPressed', onPressed))
      ..add(FlagProperty('isLoading', value: isLoading, ifTrue: 'loading'));
  }
}