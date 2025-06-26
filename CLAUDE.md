# Family Coin App - Development Guidelines

## プロジェクト概要
家族向けコイン管理アプリケーション。タスク完了によるコイン獲得、ウィッシュアイテムとの交換機能を提供。

## プロジェクト構成

### ディレクトリ構造
```
lib/
├── core/                    # コア機能
│   ├── di/                 # 依存性注入（get_it）
│   ├── exception/          # エラー処理
│   └── l10n/              # 国際化（廃止予定）
├── application/            # アプリケーション層
│   ├── provider/          # Riverpodのプロバイダー（状態管理）
│   └── usecase/           # ユースケース
│       ├── task/          # タスク関連のユースケース
│       ├── user/          # ユーザー関連のユースケース
│       └── wishitem/      # 欲しいもの関連のユースケース
├── domain/                # ドメイン層
│   ├── model/             # ドメインモデル
│   │   ├── task/          # タスクモデル
│   │   ├── user/          # ユーザーモデル
│   │   └── wishitem/      # 欲しいものモデル
│   ├── repository/        # リポジトリインターフェース
│   ├── value_object/      # 値オブジェクト
│   │   ├── base/          # 基底クラス
│   │   └── converter/     # JSON変換器
│   └── error/             # ドメインエラー
├── infrastructure/        # インフラストラクチャ層
│   ├── repository/        # リポジトリ実装
│   ├── datasource/        # データソース
│   │   └── local_datasource/ # ローカルデータソース
│   │       └── db_schema/ # データベーススキーマ
│   └── client/            # 外部クライアント（SQLite等）
└── presentation/          # プレゼンテーション層
    ├── ui/                # UIコンポーネント
    │   ├── common/        # 共通UI
    │   │   ├── pages/     # 共通ページ
    │   │   ├── theme/     # テーマ
    │   │   └── widgets/   # 共通ウィジェット
    │   ├── home/          # ホーム画面
    │   ├── task/          # タスク画面
    │   ├── wishItem/      # 欲しいもの画面
    │   └── scaffold/      # スキャフォールド
    ├── routing/           # ルーティング（go_router）
    ├── l10n/              # 国際化
    └── util/              # ユーティリティ
        └── extension/     # 拡張機能
```

## 技術スタック

### 使用ライブラリ
- **状態管理**: flutter_riverpod ^2.6.1
- **ルーティング**: go_router ^15.1.2
- **依存性注入**: get_it ^8.0.3
- **データベース**: sqflite ^2.4.2
- **ローカルストレージ**: shared_preferences ^2.5.3
- **コード生成**: freezed, json_annotation, riverpod_annotation
- **国際化**: intl ^0.20.2, flutter_localizations
- **UI**: flutter_slidable ^4.0.0, table_calendar ^3.2.0
- **スケジュール**: rrule ^0.2.17

### 開発ツール
- build_runner: コード生成
- flutter_lints: Lint
- mocktail: テスト用モック

## アーキテクチャルール

### Clean Architecture
- 依存関係の方向: presentation → application → domain
- ドメイン層は外部ライブラリに依存しない
- プレゼンテーション層はRiverpod v2を使用

### 依存性注入
- `get_it`を使用したDIコンテナ
- アプリケーション起動時に`DependencyInjection.local()`で初期化
- `lib/core/di/dependency_injection.dart`で管理
- シングルトンオブジェクトの管理に使用
- 外部リソースへのアクセスはインフラストラクチャ層で実装
- アプリケーション層はドメイン層のインターフェースにのみ依存
- テスト用リセット機能あり

## コーディング規約

### 命名規則
- **ファイル名**: スネークケース（例: get_user_info_usecase.dart）
- **クラス名**: パスカルケース（例: GetUserInfoUseCase）
- **変数名**: キャメルケース（例: userRepository）
- **定数**: 大文字のスネークケース（例: MAX_COIN_BALANCE）
- **Provider名**: キャメルケース（例: userStateProvider）
- **ディレクトリ名**: スネークケース（例: user_list_state）

### フォーマットルール
- **インデント**: 2スペース
- **行の長さ**: 最大120文字
- **プライベートメンバー**: アンダースコアで始める（例: _userRepository）

### コメント
- 日本語コメント使用可
- クラスやメソッドには必ずドキュメントコメントを付ける
- `/// constructor`形式でコンストラクタをコメント

### Lint Rules
- `analysis_options.yaml`で厳格なルールを適用
- 以下のルールは除外済み:
  - `always_specify_types`: コード冗長性回避
  - `lines_longer_than_80_chars`: 120文字まで許容
  - `unnecessary_await_in_return`: パフォーマンス考慮

## データモデル設計

### Freezed データクラス
- モデルクラスはfreezedを使用
- `copyWith`, `==`, `hashCode`自動生成
- JSON serialization対応

### Value Object パターン
- `lib/domain/value_object/base/value_object.dart`をベースとした値オブジェクト
- 不変性保証、等価性比較実装
- JSON変換用コンバーター提供

### JSON変換
- json_annotationを使用
- コンバーターは`lib/domain/value_object/converter/`に配置

## 状態管理

### Riverpod v2
- ProviderはRiverpod v2の形式を使用
- `@riverpod`アノテーションを使用
- `Ref`を使用して依存関係を注入
- コード生成を使用（`part 'ファイル名.g.dart'`）
- ConsumerWidget/ConsumerStatefulWidgetを使用

### Providerの配置ルール
- Providerは`lib/application/provider/`に配置
- 関連するProviderは同じファイルにまとめる
- Provider名は機能を表す名前にする（例: `userStateProvider`, `taskListStateProvider`）
- 複雑なロジックはUseCaseに委譲する
- 外部リソースへのアクセスはUseCaseで行う
- プレゼンテーション層はアプリケーション層のProviderのみを使用

## UI構成ルール

### アトミックデザイン構造
```
presentation/ui/
├── components/           # アトミックデザインコンポーネント
│   ├── atoms/           # 最小単位のUIコンポーネント
│   │   ├── buttons/     # ボタン類
│   │   ├── inputs/      # 入力フィールド
│   │   ├── text/        # テキスト要素
│   │   ├── icons/       # アイコン
│   │   └── spacing/     # スペーシング・デザイントークン
│   ├── molecules/       # Atomsを組み合わせた機能単位
│   │   ├── forms/       # フォーム関連コンポーネント
│   │   ├── cards/       # カード型コンポーネント
│   │   ├── lists/       # リスト型コンポーネント
│   │   └── navigation/  # ナビゲーション要素
│   ├── organisms/       # 複雑な機能を持つコンポーネント群
│   │   ├── sections/    # セクション・フォーム
│   │   └── panels/      # パネル・ダッシュボード
│   └── templates/       # ページレベルのテンプレート
├── pages/               # 実際のページコンポーネント（従来構造）
│   ├── home/
│   ├── task/
│   └── wishItem/
└── common/              # 従来の共通コンポーネント（段階的移行）
```

### アトミックデザイン原則

#### Atoms（原子）
- **責務**: 最小単位のUIコンポーネント、再利用可能な基本要素
- **例**: PrimaryButton, TextInput, AppText, Spacing
- **特徴**: 
  - 他のコンポーネントに依存しない
  - プロパティによる振る舞いの制御
  - デザインシステムの基盤

#### Molecules（分子）
- **責務**: 複数のAtomsを組み合わせた機能単位
- **例**: LabeledTextInput, SchedulePicker, TappableEditableText
- **特徴**:
  - 特定の機能や目的を持つ
  - Atomsのみに依存
  - 再利用可能な機能ブロック

#### Organisms（生体）
- **責務**: 複雑なUIセクション、ビジネスロジックを含む
- **例**: TaskFormOrganism, UserProfileOrganism
- **特徴**:
  - Atoms、Moleculesを組み合わせて構成
  - 具体的なコンテキストを持つ
  - 状態管理とビジネスロジック

#### Templates（テンプレート）
- **責務**: ページレベルのレイアウト構造
- **例**: TaskCreateTemplate, HomeTemplate
- **特徴**:
  - ページの骨組みを定義
  - Organismsの配置とレイアウト
  - 画面遷移ロジック

### ファイル命名規則
- **Atoms**: `component_name.dart` (例: primary_button.dart)
- **Molecules**: `component_name.dart` (例: labeled_text_input.dart)  
- **Organisms**: `component_name_organism.dart` (例: task_form_organism.dart)
- **Templates**: `page_name_template.dart` (例: task_create_template.dart)

### インポート規則
```dart
// 各レベルのexportファイルを使用
import 'package:family_coin/presentation/ui/components/atoms/atoms.dart';
import 'package:family_coin/presentation/ui/components/molecules/molecules.dart';
import 'package:family_coin/presentation/ui/components/organisms/organisms.dart';

// または統一importを使用
import 'package:family_coin/presentation/ui/components/components.dart';
```

### 段階的移行戦略
1. **新規コンポーネント**: 必ずアトミックデザイン構造で作成
2. **既存コンポーネント**: 修正時にアトミックデザインに移行
3. **従来構造**: 当面は並存、段階的に移行

### UI/UX

#### ローカライゼーション
- 英語・日本語対応
- `assets/l10n/`にARBファイル
- `context.l10n`で翻訳文字列アクセス
- 国際化は`lib/presentation/l10n/`で管理

#### テーマ
- Material Design準拠
- primarySwatch: Colors.indigo
- カスタムスペーシング定義済み

#### ナビゲーション
- go_routerによる宣言的ルーティング
- タイプセーフなルート定義
- BottomNavigationBar対応

## データベースルール

### SQLite (sqflite)
- ローカルストレージ
- `lib/infrastructure/client/sqflite_client.dart`で管理
- アプリライフサイクル連動

### スキーマ管理
- スキーマ定義は`lib/infrastructure/datasource/local_datasource/db_schema/`に配置
- マイグレーションは適切に管理する
- ローカルデータソースは`lib/infrastructure/datasource/local_datasource/`に配置

### テーブル設計
- users: ユーザー情報
- tasks: タスク定義・繰り返しルール
- transaction_logs: コイン取引履歴
- wishitems: ウィッシュアイテム

## テスト

### テスト構成
- テストはtest/ディレクトリに配置
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

### その他のルール
- 環境変数は.envファイルで管理
- コミットメッセージは日本語で記述
- コード生成が必要な場合は`build_runner`を使用
- エラーハンドリングは適切な層で実装

## トラブルシューティング

### 一般的な問題
- コード生成エラー: `dart run build_runner clean`後再実行
- Lintエラー: `analysis_options.yaml`の除外ルール確認
- DI関連エラー: `DependencyInjection.reset()`でリセット

### パフォーマンス
- 大きなリスト: `ListView.builder`使用
- 状態管理: 過度なrebuild回避
- 画像: 適切なサイズ・フォーマット使用