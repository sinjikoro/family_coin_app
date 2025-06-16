// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class L10nJa extends L10n {
  L10nJa([String locale = 'ja']) : super(locale);

  @override
  String get homeTitle => 'ホーム';

  @override
  String homeCoinBalance(Object balance) {
    return 'コイン残高: $balance';
  }

  @override
  String get homeUserNotFound => 'ユーザー情報がありません';

  @override
  String get taskListTitle => 'タスク一覧';

  @override
  String get taskListEmpty => 'タスクがありません';

  @override
  String get taskCreateTitle => '新しいタスク';

  @override
  String get taskDetailTitle => 'タスク詳細';

  @override
  String get taskNameRequired => 'タスク名は必須項目です。';

  @override
  String get taskEarnCoinRequired => '付与コインは必須項目です。';

  @override
  String get taskEarnCoinMustBeNumber => '付与コインは数値で入力してください。';

  @override
  String get taskDifficultyRequired => '難易度は必須項目です。';

  @override
  String get taskDifficultyMustBeNumber => '難易度は数値で入力してください。';

  @override
  String get wishitemPriceMustBeNumber => '価格は数値で入力してください。';

  @override
  String get taskName => 'タスク名';

  @override
  String get taskEarnCoin => '付与コイン';

  @override
  String get taskDescription => '説明';

  @override
  String get taskDifficulty => '難易度';

  @override
  String get taskDone => '完了';

  @override
  String get taskScheduledSelect => 'スケジュール選択';

  @override
  String get taskNotScheduled => '日付指定なし';

  @override
  String get taskScheduledToday => '今日';

  @override
  String get taskScheduledTommorow => '明日';

  @override
  String get taskScheduledWeekend => '今週末';

  @override
  String get taskScheduleCustom => 'カスタム';

  @override
  String get taskScheduleNotRecurrence => '繰り返しなし';

  @override
  String get wishitemListTitle => 'ほしいもの一覧';

  @override
  String get wishitemListEmpty => 'ほしいものはありません';

  @override
  String get wishitemCreateTitle => '新しいほしいもの';

  @override
  String get wishitemDetailTitle => 'ほしいもの詳細';

  @override
  String get wishItemName => 'ほしいもの名';

  @override
  String get wishItemDescription => '説明';

  @override
  String get wishItemPrice => '価格（コイン）';

  @override
  String get wishItemURL => 'URL（任意）';

  @override
  String get wishItemExchange => '購入';

  @override
  String get dateFormat => 'yyyy/MM/dd (EEE)';

  @override
  String error(Object errorMessage) {
    return 'エラーが発生しました! : $errorMessage';
  }

  @override
  String get errorNotFoundData => 'データが見つかりませんでした。';

  @override
  String get errorNotEnoughCoins => 'コインが足りません。';

  @override
  String get errorUnexpected => '予期せぬエラーが発生しました。';

  @override
  String get cancel => 'キャンセル';

  @override
  String get ok => 'OK';
}
