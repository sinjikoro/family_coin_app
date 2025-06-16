import 'package:family_coin/presentation/l10n/l10n.dart';
import 'package:flutter/material.dart';

/// コンテキストの拡張
extension ContextExtension on BuildContext {
  /// ローカライズ
  L10n get l10n => L10n.of(this)!;

  /// 画面の高さ
  double get screenHeight => MediaQuery.of(this).size.height;

  /// 画面の幅
  double get screenWidth => MediaQuery.of(this).size.width;
}
