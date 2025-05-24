import 'package:family_coin/core/l10n/l10n.dart';
import 'package:flutter/material.dart';

/// コンテキストの拡張
extension ContextExtension on BuildContext {
  /// ローカライズ
  L10n get l10n => L10n.of(this)!;
}
