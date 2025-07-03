import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// 汎用テキスト
class AppText extends StatelessWidget {
  /// コンストラクタ
  const AppText({
    required this.text,
    super.key,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.textAlign,
    this.maxLines,
  });

  /// タイトルテキスト
  const AppText.title({
    required this.text,
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
  }) : fontSize = 20,
       fontWeight = FontWeight.w700;

  /// 特大テキスト
  const AppText.xLarge({
    required this.text,
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
  }) : fontSize = 40,
       fontWeight = FontWeight.w700;

  /// 大きめのテキスト
  const AppText.large({
    required this.text,
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
  }) : fontSize = 24,
       fontWeight = FontWeight.w700;

  /// 中くらいのテキスト
  const AppText.medium({
    required this.text,
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
  }) : fontSize = 18,
       fontWeight = FontWeight.w700;

  /// 小さめのテキスト
  const AppText.small({
    required this.text,
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
  }) : fontSize = 14,
       fontWeight = FontWeight.w500;

  /// 表示するテキスト
  final String text;

  /// フォントサイズ
  final double? fontSize;

  /// フォントウェイト
  final FontWeight? fontWeight;

  /// テキスト色
  final Color? color;

  /// テキストアライン
  final TextAlign? textAlign;

  /// 最大行数
  final int? maxLines;

  @override
  Widget build(BuildContext context) => Text(
    text,
    maxLines: maxLines,
    overflow: maxLines != null ? TextOverflow.ellipsis : null,
    textAlign: textAlign,
    style: TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color ?? Theme.of(context).textTheme.bodyMedium?.color,
    ),
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('text', text))
      ..add(DoubleProperty('fontSize', fontSize))
      ..add(ObjectFlagProperty<FontWeight>('fontWeight', fontWeight))
      ..add(ColorProperty('color', color))
      ..add(EnumProperty<TextAlign>('textAlign', textAlign))
      ..add(IntProperty('maxLines', maxLines));
  }
}
