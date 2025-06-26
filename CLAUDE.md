# Family Coin App - Development Guidelines

## プロジェクト概要
家族向けコイン管理アプリケーション。タスク完了によるコイン獲得、ウィッシュアイテムとの交換機能を提供。

## アーキテクチャ

### Clean Architecture
- `domain/`: ビジネスロジック、エンティティ、Value Object
- `application/`: ユースケース、状態管理（Riverpod）
- `infrastructure/`: データアクセス、外部サービス
- `presentation/`: UI、ルーティング、ローカライゼーション

### 依存性注入
- GetItを使用したDIコンテナ
- `lib/core/di/dependency_injection.dart`で管理
- テスト用リセット機能あり

## コード規約

### Lint Rules
- `analysis_options.yaml`で厳格なルールを適用
- 以下のルールは除外済み:
  - `always_specify_types`: コード冗長性回避
  - `lines_longer_than_80_chars`: 120文字まで許容
  - `unnecessary_await_in_return`: パフォーマンス考慮

### 命名規約
- クラス名: PascalCase
- メソッド/変数名: camelCase
- ファイル名: snake_case
- 定数: SCREAMING_SNAKE_CASE

### コメント
- 日本語コメント使用可
- クラス・メソッドにはドキュメントコメント必須
- `/// constructor`形式でコンストラクタをコメント

## 技術スタック

### 主要依存関係
- Flutter SDK: ^3.7.2
- flutter_riverpod: ^2.6.1 (状態管理)
- go_router: ^15.1.2 (ルーティング)
- freezed: ^3.0.6 (データクラス)
- sqflite: ^2.4.2 (ローカルDB)
- get_it: ^8.0.3 (DI)
- rrule: ^0.2.17 (繰り返しルール)
- table_calendar: ^3.2.0 (カレンダー)

### 開発ツール
- build_runner: コード生成
- flutter_lints: Lint
- mocktail: テスト用モック

## データモデル設計

### Value Object パターン
- `lib/domain/value_object/base/value_object.dart`をベースとした値オブジェクト
- 不変性保証、等価性比較実装
- JSON変換用コンバーター提供

### Freezed データクラス
- 全モデルクラスでFreezedを使用
- `copyWith`, `==`, `hashCode`自動生成
- JSON serialization対応

## 状態管理

### Riverpod
- ConsumerWidget/ConsumerStatefulWidgetを使用
- Provider定義はriverpod_generatorで自動生成
- 状態は`application/provider/`で管理

## UI/UX

### ローカライゼーション
- 英語・日本語対応
- `assets/l10n/`にARBファイル
- `context.l10n`で翻訳文字列アクセス

### テーマ
- Material Design準拠
- primarySwatch: Colors.indigo
- カスタムスペーシング定義済み

### ナビゲーション
- go_routerによる宣言的ルーティング
- タイプセーフなルート定義
- BottomNavigationBar対応

## データベース

### SQLite (sqflite)
- ローカルストレージ
- `lib/infrastructure/client/sqflite_client.dart`で管理
- アプリライフサイクル連動

### テーブル設計
- users: ユーザー情報
- tasks: タスク定義・繰り返しルール
- transaction_logs: コイン取引履歴
- wishitems: ウィッシュアイテム

## テスト

### テスト構成
- unit tests: domain層中心
- widget tests: presentation層
- mock使用: mocktailライブラリ

### テスト実行
```bash
flutter test
```

## ビルド・デプロイ

### コード生成
```bash
dart run build_runner build --delete-conflicting-outputs
```

### アプリビルド
```bash
flutter build apk --release
flutter build ios --release
```

## 重要なファイル

### 設定ファイル
- `pubspec.yaml`: 依存関係管理
- `analysis_options.yaml`: Lint設定
- `l10n.yaml`: ローカライゼーション設定

### エントリーポイント
- `lib/main.dart`: アプリ起動
- `lib/app.dart`: ルートWidget
- `lib/core/di/dependency_injection.dart`: DI設定

## 開発ワークフロー

### ブランチ戦略
- main: 本番ブランチ
- feature/*: 機能開発ブランチ
- fix/*: バグ修正ブランチ

### コミット前チェック
1. `flutter analyze`: 静的解析
2. `flutter test`: テスト実行
3. `dart format .`: コードフォーマット

## トラブルシューティング

### 一般的な問題
- コード生成エラー: `dart run build_runner clean`後再実行
- Lintエラー: `analysis_options.yaml`の除外ルール確認
- DI関連エラー: `DependencyInjection.reset()`でリセット

### パフォーマンス
- 大きなリスト: `ListView.builder`使用
- 状態管理: 過度なrebuild回避
- 画像: 適切なサイズ・フォーマット使用