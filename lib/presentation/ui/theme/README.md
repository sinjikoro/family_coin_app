# テーマシステム

このディレクトリには、Family Coin Appの統一的なテーマシステムが含まれています。

## ファイル構成

- `app_theme.dart` - メインテーマ定義（ThemeData）
- `app_colors.dart` - カラー定数定義
- `app_fonts.dart` - フォント定義（Google Fonts使用）
- `README.md` - このファイル

## 使用方法

### 1. テーマの適用

アプリ全体でテーマを適用するには、`MaterialApp`で以下のように設定します：

```dart
MaterialApp(
  theme: AppTheme.lightTheme,
  darkTheme: AppTheme.darkTheme,
  // ...
)
```

### 2. カラーの使用

#### ThemeData経由での使用（推奨）

```dart
// テキスト色
Text(
  'Hello World',
  style: Theme.of(context).textTheme.bodyLarge,
)

// プライマリカラー
Container(
  color: Theme.of(context).colorScheme.primary,
)

// 背景色
Scaffold(
  backgroundColor: Theme.of(context).colorScheme.surface,
)

// サーフェスコンテナ
Card(
  color: Theme.of(context).colorScheme.surfaceContainer,
)

// サーフェスコンテナ（高エレベーション）
Card(
  color: Theme.of(context).colorScheme.surfaceContainerHigh,
)
```

#### 直接カラー定数を使用

```dart
import 'package:family_coin/presentation/ui/theme/app_colors.dart';

Container(
  color: AppColors.primary,
  child: Text(
    'Hello World',
    style: TextStyle(color: AppColors.textPrimary),
  ),
)
```

### 3. フォントの使用

#### ThemeData経由での使用（推奨）

```dart
Text(
  'Hello World',
  style: Theme.of(context).textTheme.headlineMedium,
)
```

#### 直接フォント定数を使用

```dart
import 'package:family_coin/presentation/ui/theme/app_fonts.dart';

Text(
  'Hello World',
  style: AppFonts.headlineMedium.copyWith(color: Colors.red),
)

// Google Fontsを直接使用
Text(
  'Hello World',
  style: AppFonts.notoSansJP.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  ),
)
```

### 4. カスタムスタイルの作成

既存のテーマをベースにカスタムスタイルを作成する場合：

```dart
// テーマベースのカスタムスタイル
TextStyle customStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(
  color: AppColors.secondary,
  fontWeight: AppFonts.bold,
) ?? const TextStyle();

// フォントベースのカスタムスタイル
TextStyle customStyle = AppFonts.bodyLarge.copyWith(
  color: AppColors.secondary,
  fontWeight: AppFonts.bold,
);
```

## カラーパレット

### プライマリカラー
- `primary` - メインカラー（濃紺）
- `primaryLight` - 明るいプライマリ
- `primaryDark` - 暗いプライマリ

### セカンダリカラー
- `secondary` - セカンダリカラー（オレンジ）
- `secondaryLight` - 明るいセカンダリ
- `secondaryDark` - 暗いセカンダリ

### セマンティックカラー
- `success` - 成功（グリーン）
- `error` - エラー（レッド）
- `warning` - 警告（オレンジ）
- `info` - 情報（ブルー）

### グレースケール
- `grey50` - 最も明るいグレー
- `grey100` - 非常に明るいグレー
- `grey200` - 明るいグレー
- `grey300` - 中程度の明るいグレー
- `grey400` - 中程度のグレー
- `grey500` - 標準グレー
- `grey600` - 中程度の暗いグレー
- `grey700` - 暗いグレー
- `grey800` - 非常に暗いグレー
- `grey900` - 最も暗いグレー

### サーフェスカラー（Material Design 3）
- `surface` - メインサーフェス色
- `surfaceDim` - 暗いサーフェス色
- `surfaceBright` - 明るいサーフェス色
- `surfaceContainerLowest` - 最も明るいサーフェスコンテナ
- `surfaceContainerLow` - 明るいサーフェスコンテナ
- `surfaceContainer` - 標準サーフェスコンテナ
- `surfaceContainerHigh` - 暗いサーフェスコンテナ
- `surfaceContainerHighest` - 最も暗いサーフェスコンテナ

## フォントファミリー

- `main` - メインフォント（Noto Sans JP）
- `secondary` - セカンダリフォント（Roboto）
- `monospace` - モノスペースフォント（Noto Sans Mono）

## フォントサイズ

- `xs` - 10px
- `sm` - 12px
- `base` - 14px
- `lg` - 16px
- `xl` - 18px
- `xxl` - 20px
- `xxxl` - 24px
- `display` - 32px

## フォントウェイト

- `light` - 300
- `regular` - 400
- `medium` - 500
- `semiBold` - 600
- `bold` - 700
- `extraBold` - 800

## ベストプラクティス

1. **ThemeDataを優先使用**: 可能な限り`Theme.of(context)`を使用してテーマから値を取得
2. **カラー定数の活用**: 直接カラー値を使用する場合は`AppColors`定数を使用
3. **フォントの統一**: フォントファミリーは`AppFonts`定数を使用
4. **レスポンシブ対応**: フォントサイズは`AppFonts`の定数を使用
5. **ダークテーマ対応**: カラーは必ずライト/ダーク両方のテーマで適切に表示されることを確認
6. **Material Design 3準拠**: 非推奨の`background`、`onBackground`、`surfaceVariant`の代わりに新しいサーフェスカラーを使用
7. **サーフェスコンテナの活用**: エレベーションの代わりに`surfaceContainer`系のカラーを使用

## 既存コードの移行

既存のコードでハードコードされたカラーやフォントを移行する場合：

```dart
// Before
Text(
  'Hello',
  style: TextStyle(
    color: Color(0xFF1A1D29),
    fontSize: 16,
    fontWeight: FontWeight.bold,
  ),
)

// After
Text(
  'Hello',
  style: Theme.of(context).textTheme.titleLarge,
)
```

または

```dart
// After (直接定数使用)
Text(
  'Hello',
  style: AppFonts.titleLarge.copyWith(color: AppColors.primary),
)
```

### 非推奨プロパティの移行

Material Design 3では以下のプロパティが非推奨となりました：

```dart
// Before (非推奨)
Container(
  color: Theme.of(context).colorScheme.background,
  child: Text(
    'Hello',
    style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
  ),
)

// After (推奨)
Container(
  color: Theme.of(context).colorScheme.surface,
  child: Text(
    'Hello',
    style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
  ),
)

// Before (非推奨)
Card(
  color: Theme.of(context).colorScheme.surfaceVariant,
)

// After (推奨)
Card(
  color: Theme.of(context).colorScheme.surfaceContainer,
)
``` 