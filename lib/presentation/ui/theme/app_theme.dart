import 'package:family_coin/presentation/ui/theme/app_colors.dart';
import 'package:family_coin/presentation/ui/theme/app_fonts.dart';
import 'package:flutter/material.dart';

/// アプリ全体で使用する統一テーマ
class AppTheme {
  /// プライベートコンストラクタ
  AppTheme._();

  /// カラーパレット
  static const Color _primaryColor = AppColors.primary;
  static const Color _secondaryColor = AppColors.secondary;
  static const Color _successColor = AppColors.success;
  static const Color _errorColor = AppColors.error;
  static const Color _warningColor = AppColors.warning;
  static const Color _infoColor = AppColors.info;

  /// ライトテーマ
  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,

    // カラースキーム
    colorScheme: AppColors.lightColorScheme,

    // テキストテーマ
    textTheme: TextTheme(
      displayLarge: AppFonts.displayLarge.copyWith(color: _primaryColor),
      displayMedium: AppFonts.displayMedium.copyWith(color: _primaryColor),
      displaySmall: AppFonts.displaySmall.copyWith(color: _primaryColor),
      headlineLarge: AppFonts.headlineLarge.copyWith(color: _primaryColor),
      headlineMedium: AppFonts.headlineMedium.copyWith(color: _primaryColor),
      headlineSmall: AppFonts.headlineSmall.copyWith(color: _primaryColor),
      titleLarge: AppFonts.titleLarge.copyWith(color: _primaryColor),
      titleMedium: AppFonts.titleMedium.copyWith(color: _primaryColor),
      titleSmall: AppFonts.titleSmall.copyWith(color: _primaryColor),
      bodyLarge: AppFonts.bodyLarge.copyWith(color: _primaryColor),
      bodyMedium: AppFonts.bodyMedium.copyWith(color: _primaryColor),
      bodySmall: AppFonts.bodySmall.copyWith(color: AppColors.grey500),
      labelLarge: AppFonts.labelLarge.copyWith(color: _primaryColor),
      labelMedium: AppFonts.labelMedium.copyWith(color: _primaryColor),
      labelSmall: AppFonts.labelSmall.copyWith(color: AppColors.grey500),
    ),

    // アイコンテーマ
    iconTheme: const IconThemeData(color: _primaryColor, size: 24),

    // カードテーマ
    cardTheme: CardThemeData(
      color: AppColors.surfaceContainer,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),

    // ボタンテーマ
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _primaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),

    // テキストフィールドテーマ
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: _primaryColor, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: _errorColor),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      hintStyle: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 14),
    ),

    // アプリバーテーマ
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: _primaryColor,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: _primaryColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),

    // ボトムナビゲーションテーマ
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: _primaryColor,
      unselectedItemColor: Color(0xFF9CA3AF),
      type: BottomNavigationBarType.fixed,
      elevation: 8,
    ),

    // フローティングアクションボタンテーマ
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: _primaryColor,
      foregroundColor: Colors.white,
      shape: CircleBorder(),
    ),

    // チップテーマ
    chipTheme: ChipThemeData(
      backgroundColor: const Color(0xFFF3F4F6),
      selectedColor: _primaryColor.withValues(alpha: 0.1),
      labelStyle: const TextStyle(color: _primaryColor),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),

    // ダイバーダーテーマ
    dividerTheme: const DividerThemeData(
      color: Color(0xFFE5E7EB),
      thickness: 1,
      space: 1,
    ),

    // シャドウカラー
    shadowColor: _primaryColor.withValues(alpha: 0.1),
  );

  /// ダークテーマ
  static ThemeData get darkTheme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    // カラースキーム
    colorScheme: AppColors.darkColorScheme,

    // テキストテーマ（ダーク用）
    textTheme: TextTheme(
      displayLarge: AppFonts.displayLarge.copyWith(color: Colors.white),
      displayMedium: AppFonts.displayMedium.copyWith(color: Colors.white),
      displaySmall: AppFonts.displaySmall.copyWith(color: Colors.white),
      headlineLarge: AppFonts.headlineLarge.copyWith(color: Colors.white),
      headlineMedium: AppFonts.headlineMedium.copyWith(color: Colors.white),
      headlineSmall: AppFonts.headlineSmall.copyWith(color: Colors.white),
      titleLarge: AppFonts.titleLarge.copyWith(color: Colors.white),
      titleMedium: AppFonts.titleMedium.copyWith(color: Colors.white),
      titleSmall: AppFonts.titleSmall.copyWith(color: Colors.white),
      bodyLarge: AppFonts.bodyLarge.copyWith(color: Colors.white),
      bodyMedium: AppFonts.bodyMedium.copyWith(color: Colors.white),
      bodySmall: AppFonts.bodySmall.copyWith(color: AppColors.grey400),
      labelLarge: AppFonts.labelLarge.copyWith(color: Colors.white),
      labelMedium: AppFonts.labelMedium.copyWith(color: Colors.white),
      labelSmall: AppFonts.labelSmall.copyWith(color: AppColors.grey400),
    ),

    // アイコンテーマ（ダーク用）
    iconTheme: const IconThemeData(color: Colors.white, size: 24),

    // カードテーマ（ダーク用）
    cardTheme: CardThemeData(
      color: AppColors.grey700,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),

    // ボタンテーマ（ダーク用）
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _primaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),

    // テキストフィールドテーマ（ダーク用）
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFF374151),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF4B5563)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF4B5563)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: _primaryColor, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: _errorColor),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      hintStyle: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 14),
    ),

    // アプリバーテーマ（ダーク用）
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1F2937),
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),

    // ボトムナビゲーションテーマ（ダーク用）
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF1F2937),
      selectedItemColor: _primaryColor,
      unselectedItemColor: Color(0xFF9CA3AF),
      type: BottomNavigationBarType.fixed,
      elevation: 8,
    ),

    // フローティングアクションボタンテーマ（ダーク用）
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: _primaryColor,
      foregroundColor: Colors.white,
      shape: CircleBorder(),
    ),

    // チップテーマ（ダーク用）
    chipTheme: ChipThemeData(
      backgroundColor: const Color(0xFF374151),
      selectedColor: _primaryColor.withValues(alpha: 0.2),
      labelStyle: const TextStyle(color: Colors.white),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),

    // ダイバーダーテーマ（ダーク用）
    dividerTheme: const DividerThemeData(
      color: Color(0xFF4B5563),
      thickness: 1,
      space: 1,
    ),

    // シャドウカラー（ダーク用）
    shadowColor: Colors.black.withValues(alpha: 0.3),
  );
}
