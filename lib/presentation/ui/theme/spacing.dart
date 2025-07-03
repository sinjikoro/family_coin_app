// double型で小数点以下.0の数値定義が必要となるため
// ignore_for_file: prefer_int_literals

import 'package:flutter/material.dart';

/// アプリケーション全体で使用するスペーシングの定数
class Spacing {
  /// コンストラクタ
  const Spacing._();

  /// 最小のスペーシング (4.0)
  static const double xs = 4.0;

  /// 小さいスペーシング (8.0)
  static const double s = 8.0;

  /// 中程度のスペーシング (16.0)
  static const double m = 16.0;

  /// 大きいスペーシング (24.0)
  static const double l = 24.0;

  /// 最大のスペーシング
  static const double xl = 32.0;

  /// パディング
  static const paddingPage = EdgeInsets.all(20);

  /// CardWidgetのパディング
  static const paddingCardWidget = EdgeInsets.symmetric(
    horizontal: l,
    vertical: m,
  );

  /// 水平方向のスペーシング用SizedBox
  static SizedBox get widthXS => const SizedBox(width: xs);
  static SizedBox get widthS => const SizedBox(width: s);
  static SizedBox get widthM => const SizedBox(width: m);
  static SizedBox get widthL => const SizedBox(width: l);
  static SizedBox get widthXL => const SizedBox(width: xl);

  /// 垂直方向のスペーシング用SizedBox
  static SizedBox get heightXS => const SizedBox(height: xs);
  static SizedBox get heightS => const SizedBox(height: s);
  static SizedBox get heightM => const SizedBox(height: m);
  static SizedBox get heightL => const SizedBox(height: l);
  static SizedBox get heightXL => const SizedBox(height: xl);
}
