// double型で小数点以下.0の数値定義が必要となるため
// ignore_for_file: prefer_int_literals

import 'package:flutter/material.dart';

/// アプリケーション全体で使用するスペーシングの定数
class Spacing {
  /// コンストラクタ
  const Spacing._();

  /// 最小のスペーシング
  static const double xs = 4.0;

  /// 小さいスペーシング
  static const double sm = 8.0;

  /// 中程度のスペーシング
  static const double md = 16.0;

  /// 大きいスペーシング
  static const double lg = 24.0;

  /// 最大のスペーシング
  static const double xl = 32.0;

  /// カードのパディング
  static const EdgeInsets cardPadding = EdgeInsets.all(md);

  /// リストアイテムのパディング
  static const EdgeInsets listItemPadding = EdgeInsets.symmetric(
    horizontal: md,
    vertical: sm,
  );

  /// 画面のパディング
  static const EdgeInsets screenPadding = EdgeInsets.all(md);

  /// セクション間のスペーシング
  static const double sectionSpacing = lg;
}
