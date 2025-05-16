import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

/// コンテキストの拡張
extension ContextExtension on BuildContext {
  /// ローカライズ
  L10n get l10n => L10n.of(this)!;
}
