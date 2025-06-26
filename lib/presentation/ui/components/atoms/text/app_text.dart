import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// アプリケーション共通テキスト（Atom）
class AppText extends StatelessWidget {
  /// Constructor
  const AppText(
    this.data, {
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
    super.key,
  });

  /// 見出し1スタイル
  const AppText.heading1(
    this.data, {
    this.textAlign,
    this.overflow,
    this.maxLines,
    super.key,
  }) : style = const TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
        );

  /// 見出し2スタイル
  const AppText.heading2(
    this.data, {
    this.textAlign,
    this.overflow,
    this.maxLines,
    super.key,
  }) : style = const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        );

  /// 見出し3スタイル
  const AppText.heading3(
    this.data, {
    this.textAlign,
    this.overflow,
    this.maxLines,
    super.key,
  }) : style = const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        );

  /// 本文スタイル
  const AppText.body(
    this.data, {
    this.textAlign,
    this.overflow,
    this.maxLines,
    super.key,
  }) : style = const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
        );

  /// キャプションスタイル
  const AppText.caption(
    this.data, {
    this.textAlign,
    this.overflow,
    this.maxLines,
    super.key,
  }) : style = const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
        );

  /// テキストデータ
  final String data;

  /// テキストスタイル
  final TextStyle? style;

  /// テキスト配置
  final TextAlign? textAlign;

  /// オーバーフロー処理
  final TextOverflow? overflow;

  /// 最大行数
  final int? maxLines;

  @override
  Widget build(BuildContext context) => Text(
    data,
    style: style,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('data', data))
      ..add(DiagnosticsProperty<TextStyle?>('style', style))
      ..add(EnumProperty<TextAlign?>('textAlign', textAlign))
      ..add(EnumProperty<TextOverflow?>('overflow', overflow))
      ..add(IntProperty('maxLines', maxLines));
  }
}