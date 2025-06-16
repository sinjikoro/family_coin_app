import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:rrule/rrule.dart';

/// 日本語のRruleL10n
@immutable
class RruleL10nJa extends RruleL10n {
  const RruleL10nJa._();

  /// インスタンスを作成する
  static Future<RruleL10nJa> create() async {
    await initializeDateFormatting('ja');
    return const RruleL10nJa._();
  }

  @override
  String get locale => 'ja_JP';

  @override
  String frequencyInterval(Frequency frequency, int interval) {
    String plurals({required String one, required String singular}) =>
        switch (interval) {
          1 => one,
          _ => switch (frequency) {
            Frequency.monthly => '$intervalヶ月ごと',
            _ => '$interval$singularごと',
          },
        };

    return {
      Frequency.secondly: plurals(one: '毎秒', singular: '秒'),
      Frequency.minutely: plurals(one: '毎分', singular: '分'),
      Frequency.hourly: plurals(one: '毎時', singular: '時間'),
      Frequency.daily: plurals(one: '毎日', singular: '日'),
      Frequency.weekly: plurals(one: '毎週', singular: '週'),
      Frequency.monthly: plurals(one: '毎月', singular: 'ヶ月'),
      Frequency.yearly: plurals(one: '毎年', singular: '年'),
    }[frequency]!;
  }

  @override
  String until(DateTime until, Frequency frequency) {
    final untilString = formatWithIntl(
      () => DateFormat.yMMMd('ja_JP').format(until),
    );
    return '、$untilStringまで';
  }

  @override
  String count(int count) => switch (count) {
    1 => '、1回',
    2 => '、2回',
    _ => '、$count回',
  };

  @override
  String onInstances(String instances) => 'の$instances回目';

  @override
  String inMonths(String months, {InOnVariant variant = InOnVariant.simple}) =>
      '${_inVariant(variant)}$months';

  @override
  String inWeeks(String weeks, {InOnVariant variant = InOnVariant.simple}) =>
      '${_inVariant(variant)}年の第$weeks週';

  String _inVariant(InOnVariant variant) => switch (variant) {
    InOnVariant.simple => '',
    InOnVariant.also => 'かつ',
    InOnVariant.instanceOf => 'の',
  };

  @override
  String onDaysOfWeek(
    String days, {
    bool indicateFrequency = false,
    DaysOfWeekFrequency? frequency = DaysOfWeekFrequency.monthly,
    InOnVariant variant = InOnVariant.simple,
  }) {
    assert(variant != InOnVariant.also, 'variant is also');

    final frequencyString =
        frequency == DaysOfWeekFrequency.monthly ? '月' : '年';
    final suffix = indicateFrequency ? 'の$frequencyString' : '';
    return '${_onVariant(variant)}$days$suffix';
  }

  @override
  String? get weekdaysString => '平日';
  @override
  String get everyXDaysOfWeekPrefix => '毎';
  @override
  String nthDaysOfWeek(Iterable<int> occurrences, String daysOfWeek) {
    if (occurrences.isEmpty) return daysOfWeek;

    final ordinals = list(
      occurrences.map((n) => n == -1 ? '最終' : '第$n').toList(),
      ListCombination.conjunctiveShort,
    );
    return '$ordinals$daysOfWeek';
  }

  @override
  String onDaysOfMonth(
    String days, {
    DaysOfVariant daysOfVariant = DaysOfVariant.dayAndFrequency,
    InOnVariant variant = InOnVariant.simple,
  }) {
    final suffix =
        {
          DaysOfVariant.simple: '日',
          DaysOfVariant.day: '日',
          DaysOfVariant.dayAndFrequency: '日',
        }[daysOfVariant];
    return '${_onVariant(variant)}$days$suffix';
  }

  @override
  String onDaysOfYear(
    String days, {
    InOnVariant variant = InOnVariant.simple,
  }) => '${_onVariant(variant)}年の$days日目';

  String _onVariant(InOnVariant variant) => switch (variant) {
    InOnVariant.simple => '',
    InOnVariant.also => 'かつ',
    InOnVariant.instanceOf => 'の',
  };

  @override
  String list(List<String> items, ListCombination combination) {
    final (two, end) = switch (combination) {
      ListCombination.conjunctiveShort => ('と', 'と'),
      ListCombination.conjunctiveLong => ('と', '、および'),
      ListCombination.disjunctive => ('または', '、または'),
    };
    return RruleL10n.defaultList(items, two: two, end: end);
  }

  @override
  String ordinal(int number) {
    assert(number != 0, 'number is 0');
    if (number == -1) return '最終';

    final n = number.abs();
    return number < 0 ? '後ろから$n' : '$n';
  }
}
