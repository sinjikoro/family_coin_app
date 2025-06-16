// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class L10nEn extends L10n {
  L10nEn([String locale = 'en']) : super(locale);

  @override
  String get homeTitle => 'home';

  @override
  String homeCoinBalance(Object balance) {
    return 'balance: $balance';
  }

  @override
  String get homeUserNotFound => 'Not Found.';

  @override
  String get taskListTitle => 'task list';

  @override
  String get taskListEmpty => 'empty..';

  @override
  String get taskCreateTitle => 'new task';

  @override
  String get taskDetailTitle => 'task detail';

  @override
  String get taskNameRequired => 'task name required.';

  @override
  String get taskEarnCoinRequired => 'earn coins required.';

  @override
  String get taskEarnCoinMustBeNumber => 'earn coins must be number.';

  @override
  String get taskDifficultyRequired => 'difficulty required.';

  @override
  String get taskDifficultyMustBeNumber => 'difficulty must be number.';

  @override
  String get wishitemPriceMustBeNumber => 'price must be number.';

  @override
  String get taskName => 'task name';

  @override
  String get taskEarnCoin => 'earn coin';

  @override
  String get taskDescription => 'description';

  @override
  String get taskDifficulty => 'difficulty';

  @override
  String get taskDone => 'done';

  @override
  String get taskScheduledSelect => 'select schedule';

  @override
  String get taskNotScheduled => 'not scheduled';

  @override
  String get taskScheduledToday => 'today';

  @override
  String get taskScheduledTommorow => 'tommorow';

  @override
  String get taskScheduledWeekend => 'week end';

  @override
  String get taskScheduleCustom => 'custom';

  @override
  String get taskScheduleNotRecurrence => 'no recurrence';

  @override
  String get wishitemListTitle => 'wishitem list';

  @override
  String get wishitemListEmpty => 'empty..';

  @override
  String get wishitemCreateTitle => 'new withItem';

  @override
  String get wishitemDetailTitle => 'wishitem detail';

  @override
  String get wishItemName => 'wishitem name';

  @override
  String get wishItemDescription => 'description';

  @override
  String get wishItemPrice => 'price(coin)';

  @override
  String get wishItemURL => 'URL(optional)';

  @override
  String get wishItemExchange => 'exchange';

  @override
  String get dateFormat => 'MM/dd/yyyy (EEE)';

  @override
  String error(Object errorMessage) {
    return 'error occurred! : $errorMessage';
  }

  @override
  String get errorNotFoundData => 'Not Found';

  @override
  String get errorNotEnoughCoins => 'Not Enough coins';

  @override
  String get errorUnexpected => 'Unexpected Error';

  @override
  String get cancel => 'Cancel';

  @override
  String get ok => 'OK';
}
