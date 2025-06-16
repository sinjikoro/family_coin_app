import 'package:family_coin/presentation/l10n/rrule_l10n_ja.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rrule/rrule.dart';

void main() {
  group('RRuleの日本語表示テスト', () {
    late RruleL10nJa l10n;

    setUpAll(() async {
      l10n = await RruleL10nJa.create();
    });

    test('基本的な頻度パターン', () {
      final patterns = {
        'RRULE:FREQ=SECONDLY': '毎秒',
        'RRULE:FREQ=MINUTELY': '毎分',
        'RRULE:FREQ=HOURLY': '毎時',
        'RRULE:FREQ=DAILY': '毎日',
        'RRULE:FREQ=WEEKLY': '毎週',
        'RRULE:FREQ=MONTHLY': '毎月',
        'RRULE:FREQ=YEARLY': '毎年',
      };

      for (final entry in patterns.entries) {
        final rrule = RecurrenceRule.fromString(entry.key);
        expect(rrule.toText(l10n: l10n), entry.value);
      }
    });

    test('間隔付きの頻度パターン', () {
      final patterns = {
        'RRULE:FREQ=DAILY;INTERVAL=2': '2日ごと',
        'RRULE:FREQ=WEEKLY;INTERVAL=2': '2週ごと',
        'RRULE:FREQ=MONTHLY;INTERVAL=2': '2ヶ月ごと',
        'RRULE:FREQ=YEARLY;INTERVAL=2': '2年ごと',
        'RRULE:FREQ=DAILY;INTERVAL=3': '3日ごと',
        'RRULE:FREQ=WEEKLY;INTERVAL=3': '3週ごと',
        'RRULE:FREQ=MONTHLY;INTERVAL=3': '3ヶ月ごと',
        'RRULE:FREQ=YEARLY;INTERVAL=3': '3年ごと',
      };

      for (final entry in patterns.entries) {
        final rrule = RecurrenceRule.fromString(entry.key);
        expect(rrule.toText(l10n: l10n), entry.value);
      }
    });

    test('曜日指定パターン', () {
      final patterns = {
        'RRULE:FREQ=WEEKLY;BYDAY=MO,WE,FR': '毎週 月曜日, 水曜日と金曜日',
        'RRULE:FREQ=WEEKLY;BYDAY=TU,TH': '毎週 火曜日と木曜日',
        'RRULE:FREQ=WEEKLY;BYDAY=SA,SU': '毎週 土曜日と日曜日',
        'RRULE:FREQ=WEEKLY;BYDAY=MO,TU,WE,TH,FR': '毎週 平日',
      };

      for (final entry in patterns.entries) {
        final rrule = RecurrenceRule.fromString(entry.key);
        expect(rrule.toText(l10n: l10n), entry.value);
      }
    });

    test('日付指定パターン', () {
      final patterns = {
        'RRULE:FREQ=MONTHLY;BYMONTHDAY=1': '毎月 1日',
        'RRULE:FREQ=MONTHLY;BYMONTHDAY=15': '毎月 15日',
        'RRULE:FREQ=MONTHLY;BYMONTHDAY=-1': '毎月 最終日',
        'RRULE:FREQ=MONTHLY;BYMONTHDAY=1,15': '毎月 1と15日',
      };

      for (final entry in patterns.entries) {
        final rrule = RecurrenceRule.fromString(entry.key);
        expect(rrule.toText(l10n: l10n), entry.value);
      }
    });

    test('序数指定パターン', () {
      final patterns = {
        'RRULE:FREQ=MONTHLY;BYDAY=1MO': '毎月 第1月曜日',
        'RRULE:FREQ=MONTHLY;BYDAY=2TU': '毎月 第2火曜日',
        'RRULE:FREQ=MONTHLY;BYDAY=-1FR': '毎月 最終金曜日',
        'RRULE:FREQ=MONTHLY;BYDAY=1MO,3MO': '毎月 第1と第3月曜日',
      };

      for (final entry in patterns.entries) {
        final rrule = RecurrenceRule.fromString(entry.key);
        expect(rrule.toText(l10n: l10n), entry.value);
      }
    });

    test('年指定パターン', () {
      // TODO(naga): 表記を X月 X日 にする
      final patterns = {
        'RRULE:FREQ=YEARLY;BYMONTH=1;BYMONTHDAY=1': '毎年 1日 1月',
        'RRULE:FREQ=YEARLY;BYMONTH=12;BYMONTHDAY=31': '毎年 31日 12月',
        'RRULE:FREQ=YEARLY;BYMONTH=2;BYMONTHDAY=29': '毎年 29日 2月',
      };

      for (final entry in patterns.entries) {
        final rrule = RecurrenceRule.fromString(entry.key);
        expect(rrule.toText(l10n: l10n), entry.value);
      }
    });

    test('複合パターン', () {
      final patterns = {
        'RRULE:FREQ=WEEKLY;INTERVAL=2;BYDAY=TU,TH': '2週ごと 火曜日と木曜日',
        'RRULE:FREQ=MONTHLY;BYMONTHDAY=1;BYMONTH=1,7': '毎月 1月と7月 1日',
        'RRULE:FREQ=WEEKLY;BYDAY=MO,WE,FR;UNTIL=20241231T235959Z':
            '毎週 月曜日, 水曜日と金曜日、2024年12月31日まで',
        'RRULE:FREQ=MONTHLY;COUNT=3;BYMONTHDAY=1': '毎月 1日、3回',
      };

      for (final entry in patterns.entries) {
        final rrule = RecurrenceRule.fromString(entry.key);
        expect(rrule.toText(l10n: l10n), entry.value);
      }
    });
  });
}
