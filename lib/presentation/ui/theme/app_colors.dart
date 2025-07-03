import 'package:flutter/material.dart';

/// アプリで使用するカラー定数
class AppColors {
  /// プライベートコンストラクタ
  AppColors._();

  // プライマリカラー
  static const Color primary = Color(0xFF1A1D29);
  static const Color primaryLight = Color(0xFF2D3748);
  static const Color primaryDark = Color(0xFF0F1419);

  // セカンダリカラー
  static const Color secondary = Color(0xFFF59E0B);
  static const Color secondaryLight = Color(0xFFFBBF24);
  static const Color secondaryDark = Color(0xFFD97706);

  // セマンティックカラー
  static const Color success = Color(0xFF10B981);
  static const Color successLight = Color(0xFF34D399);
  static const Color successDark = Color(0xFF059669);

  static const Color error = Color(0xFFEF4444);
  static const Color errorLight = Color(0xFFF87171);
  static const Color errorDark = Color(0xFFDC2626);

  static const Color warning = Color(0xFFF59E0B);
  static const Color warningLight = Color(0xFFFBBF24);
  static const Color warningDark = Color(0xFFD97706);

  static const Color info = Color(0xFF3B82F6);
  static const Color infoLight = Color(0xFF60A5FA);
  static const Color infoDark = Color(0xFF2563EB);

  // グレースケール
  static const Color grey50 = Color(0xFFF9FAFB);
  static const Color grey100 = Color(0xFFF3F4F6);
  static const Color grey200 = Color(0xFFE5E7EB);
  static const Color grey300 = Color(0xFFD1D5DB);
  static const Color grey400 = Color(0xFF9CA3AF);
  static const Color grey500 = Color(0xFF6B7280);
  static const Color grey600 = Color(0xFF4B5563);
  static const Color grey700 = Color(0xFF374151);
  static const Color grey800 = Color(0xFF1F2937);
  static const Color grey900 = Color(0xFF111827);

  // 基本色
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color transparent = Colors.transparent;

  // 背景色
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceDim = Color(0xFFF8FAFC);
  static const Color surfaceBright = Color(0xFFFFFFFF);
  static const Color surfaceContainerLowest = Color(0xFFFFFFFF);
  static const Color surfaceContainerLow = Color(0xFFF8FAFC);
  static const Color surfaceContainer = Color(0xFFF3F4F6);
  static const Color surfaceContainerHigh = Color(0xFFE5E7EB);
  static const Color surfaceContainerHighest = Color(0xFFD1D5DB);

  // テキスト色
  static const Color textPrimary = Color(0xFF1A1D29);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textTertiary = Color(0xFF9CA3AF);
  static const Color textInverse = Color(0xFFFFFFFF);
  static const Color onSurface = Color(0xFF1A1D29);
  static const Color onSurfaceVariant = Color(0xFF6B7280);

  // ボーダー色
  static const Color border = Color(0xFFE5E7EB);
  static const Color borderLight = Color(0xFFF3F4F6);

  // シャドウ色
  static const Color shadow = Color(0x1A1A1D29);
  static const Color shadowDark = Color(0x4D000000);

  // オーバーレイ色
  static const Color overlay = Color(0x80000000);
  static const Color overlayLight = Color(0x40000000);

  /// カラーパレット（Material Design 3準拠）
  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: primary,
    onPrimary: white,
    primaryContainer: Color(0xFFE0E7FF),
    onPrimaryContainer: primary,
    secondary: secondary,
    onSecondary: white,
    secondaryContainer: Color(0xFFFFF3CD),
    onSecondaryContainer: secondaryDark,
    tertiary: info,
    onTertiary: white,
    tertiaryContainer: Color(0xFFDBEAFE),
    onTertiaryContainer: infoDark,
    error: error,
    onError: white,
    errorContainer: Color(0xFFFEE2E2),
    onErrorContainer: errorDark,
    surface: surface,
    onSurface: textPrimary,
    surfaceDim: Color(0xFFF8FAFC),
    surfaceBright: white,
    surfaceContainerLowest: white,
    surfaceContainerLow: Color(0xFFF8FAFC),
    surfaceContainer: Color(0xFFF3F4F6),
    surfaceContainerHigh: Color(0xFFE5E7EB),
    surfaceContainerHighest: Color(0xFFD1D5DB),
    onSurfaceVariant: textSecondary,
    outline: border,
    outlineVariant: borderLight,
    shadow: shadow,
    scrim: overlay,
    inverseSurface: grey900,
    onInverseSurface: white,
    inversePrimary: primaryLight,
    surfaceTint: primary,
  );

  /// ダークカラーパレット
  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: primaryLight,
    onPrimary: white,
    primaryContainer: Color(0xFF1E3A8A),
    onPrimaryContainer: Color(0xFFDBEAFE),
    secondary: secondaryLight,
    onSecondary: black,
    secondaryContainer: Color(0xFF92400E),
    onSecondaryContainer: Color(0xFFFFF3CD),
    tertiary: infoLight,
    onTertiary: black,
    tertiaryContainer: Color(0xFF1E40AF),
    onTertiaryContainer: Color(0xFFDBEAFE),
    error: errorLight,
    onError: black,
    errorContainer: Color(0xFF991B1B),
    onErrorContainer: Color(0xFFFEE2E2),
    surface: grey800,
    onSurface: white,
    surfaceDim: grey900,
    surfaceBright: grey700,
    surfaceContainerLowest: grey900,
    surfaceContainerLow: grey800,
    surfaceContainer: grey700,
    surfaceContainerHigh: grey600,
    surfaceContainerHighest: grey500,
    onSurfaceVariant: grey300,
    outline: grey600,
    outlineVariant: grey700,
    shadow: shadowDark,
    scrim: overlay,
    inverseSurface: white,
    onInverseSurface: grey900,
    inversePrimary: primary,
    surfaceTint: primaryLight,
  );
}
