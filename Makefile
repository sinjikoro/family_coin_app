.PHONY: setup clean build test analyze

# 初期設定（FVM使用、依存関係取得、コード生成）
setup:
	@echo "🚀 Flutterプロジェクトの初期設定を開始します..."
	fvm use
	fvm flutter pub get
	fvm flutter pub run build_runner build --delete-conflicting-outputs
	@echo "✅ 全プロジェクトの初期設定が完了しました！"

# 初期設定（FVM使用、依存関係取得、コード生成）
setup_all:
	@echo "🚀 Flutterプロジェクトの初期設定を開始します..."
	fvm use
	fvm flutter pub get
	fvm flutter pub run build_runner build --delete-conflicting-outputs
	@echo "📚 Widgetbookプロジェクトの設定を開始します..."
	cd widgetbook && fvm use && fvm flutter pub get && fvm flutter pub run build_runner build --delete-conflicting-outputs
	@echo "✅ 全プロジェクトの初期設定が完了しました！"

# 初期設定（FVM使用、依存関係取得、コード生成）
setup_wb:
	@echo "📚 Widgetbookプロジェクトの設定を開始します..."
	cd widgetbook && fvm use && fvm flutter pub get && fvm flutter pub run build_runner build --delete-conflicting-outputs
	@echo "✅ 全プロジェクトの初期設定が完了しました！"

# クリーンアップ
clean:
	@echo "🧹 プロジェクトをクリーンアップします..."
	fvm flutter clean
	fvm flutter pub get
	@echo "✅ クリーンアップが完了しました！"

# ビルド
build:
	@echo "🔨 プロジェクトをビルドします..."
	fvm flutter build apk --release
	@echo "✅ ビルドが完了しました！"

# テスト実行
test:
	@echo "🧪 テストを実行します..."
	fvm flutter test
	@echo "✅ テストが完了しました！"

# 静的解析
analyze:
	@echo "🔍 静的解析を実行します..."
	fvm flutter analyze
	@echo "✅ 静的解析が完了しました！"

# コード生成のみ
codegen:
	@echo "⚙️ コード生成を実行します..."
	fvm flutter pub run build_runner build --delete-conflicting-outputs
	@echo "✅ コード生成が完了しました！"

# ウォッチモードでコード生成
codegen-watch:
	@echo "👀 ウォッチモードでコード生成を開始します..."
	fvm flutter pub run build_runner watch --delete-conflicting-outputs

# widgetbookの起動
widgetbook:
	@echo "🚀 Widgetbookを起動します..."
	cd widgetbook && fvm flutter run -d chrome

# 全体的なチェック（テスト + 解析）
check: test analyze
	@echo "✅ 全体的なチェックが完了しました！"

# 開発環境の完全リセット
reset: clean setup
	@echo "🔄 開発環境をリセットしました！" 