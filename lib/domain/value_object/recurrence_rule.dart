import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rrule/rrule.dart';

/// 繰り返しルール
class RRule {
  /// コンストラクタ
  const RRule(this._rrule);

  /// 毎日
  factory RRule.daily() => const RRule('RRULE:FREQ=DAILY');

  /// 毎週
  factory RRule.weekly({required List<int> weekdays}) {
    final weekdayStr = weekdays.map(_weekdayToString).join(',');
    return RRule('RRULE:FREQ=WEEKLY;BYDAY=$weekdayStr');
  }

  /// 毎月
  factory RRule.monthly({
    List<int>? monthDays,
    List<int>? weekdays,
    List<int>? setPositions,
  }) {
    final parts = <String>['FREQ=MONTHLY'];

    if (monthDays != null) {
      parts.add('BYMONTHDAY=${monthDays.join(',')}');
    }

    if (weekdays != null) {
      final weekdayStr = weekdays.map(_weekdayToString).join(',');
      parts.add('BYDAY=$weekdayStr');
    }

    if (setPositions != null) {
      parts.add('BYSETPOS=${setPositions.join(',')}');
    }

    return RRule('RRULE:${parts.join(';')}');
  }

  /// 内部のRRULE
  final String _rrule;

  /// 次の実行日を取得
  DateTime? nextOccurrence(DateTime from) {
    // RRulrはUTCで処理するため、fromをUTCに変換する
    final utcFrom = from.copyWith(isUtc: true);
    final instances = RecurrenceRule.fromString(
      _rrule,
    ).getInstances(start: utcFrom);
    return instances.take(1).first;
  }

  /// 指定期間内の実行日を取得
  List<DateTime> occurrencesBetween(DateTime start, DateTime end) {
    // RRulrはUTCで処理するため、startをUTCに変換する
    final utcStart = start.copyWith(isUtc: true);
    final utcEnd = end.copyWith(isUtc: true);
    final rrule = RecurrenceRule.fromString(
      _rrule,
    ).getInstances(start: utcStart, before: utcEnd);
    return rrule.toList();
  }

  /// 文字列に変換
  @override
  String toString() => _rrule;

  /// 曜日を文字列に変換
  static String _weekdayToString(int weekday) {
    switch (weekday) {
      case 0:
        return 'SU';
      case 1:
        return 'MO';
      case 2:
        return 'TU';
      case 3:
        return 'WE';
      case 4:
        return 'TH';
      case 5:
        return 'FR';
      case 6:
        return 'SA';
      default:
        throw ArgumentError('Invalid weekday: $weekday');
    }
  }
}

/// RRuleのJSONコンバーター
class RRuleJsonConverter implements JsonConverter<RRule, String> {
  /// コンストラクタ
  const RRuleJsonConverter();

  @override
  RRule fromJson(String json) => RRule(json);

  @override
  String toJson(RRule object) => object.toString();
}
