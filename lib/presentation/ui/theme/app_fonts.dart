import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// アプリで使用するフォントファミリー
class AppFonts {
  /// プライベートコンストラクタ
  AppFonts._();

  /// メインフォントファミリー（日本語対応）
  static const String main = 'Noto Sans JP';

  /// セカンダリフォントファミリー（英語用）
  static const String secondary = 'Roboto';

  /// モノスペースフォント（コード用）
  static const String monospace = 'Noto Sans Mono';

  /// Google Fontsを使用したテキストスタイル
  static TextStyle get notoSansJP => GoogleFonts.notoSansJp();
  static TextStyle get notoSansJPMedium =>
      GoogleFonts.notoSansJp(fontWeight: FontWeight.w500);
  static TextStyle get notoSansJPBold =>
      GoogleFonts.notoSansJp(fontWeight: FontWeight.w700);
  static TextStyle get roboto => GoogleFonts.roboto();
  static TextStyle get notoSansMono => GoogleFonts.notoSansMono();

  /// フォントウェイト
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;

  /// フォントサイズ
  static const double xs = 10.0;
  static const double sm = 12.0;
  static const double base = 14.0;
  static const double lg = 16.0;
  static const double xl = 18.0;
  static const double xxl = 20.0;
  static const double xxxl = 24.0;
  static const double display = 32.0;

  /// テキストスタイル
  static const TextStyle displayLarge = TextStyle(
    fontFamily: main,
    fontSize: display,
    fontWeight: bold,
  );

  static const TextStyle displayMedium = TextStyle(
    fontFamily: main,
    fontSize: xxxl,
    fontWeight: bold,
  );

  static const TextStyle displaySmall = TextStyle(
    fontFamily: main,
    fontSize: xxl,
    fontWeight: bold,
  );

  static const TextStyle headlineLarge = TextStyle(
    fontFamily: main,
    fontSize: xl,
    fontWeight: bold,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontFamily: main,
    fontSize: lg,
    fontWeight: bold,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontFamily: main,
    fontSize: base,
    fontWeight: bold,
  );

  static const TextStyle titleLarge = TextStyle(
    fontFamily: main,
    fontSize: lg,
    fontWeight: semiBold,
  );

  static const TextStyle titleMedium = TextStyle(
    fontFamily: main,
    fontSize: base,
    fontWeight: semiBold,
  );

  static const TextStyle titleSmall = TextStyle(
    fontFamily: main,
    fontSize: sm,
    fontWeight: semiBold,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontFamily: main,
    fontSize: lg,
    fontWeight: regular,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: main,
    fontSize: base,
    fontWeight: regular,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: main,
    fontSize: sm,
    fontWeight: regular,
  );

  static const TextStyle labelLarge = TextStyle(
    fontFamily: main,
    fontSize: base,
    fontWeight: medium,
  );

  static const TextStyle labelMedium = TextStyle(
    fontFamily: main,
    fontSize: sm,
    fontWeight: medium,
  );

  static const TextStyle labelSmall = TextStyle(
    fontFamily: main,
    fontSize: xs,
    fontWeight: medium,
  );
}
