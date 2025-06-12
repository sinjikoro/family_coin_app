import 'package:family_coin/domain/value_object/recurrence_rule.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('RRule', () {
    test('dailyを生成できる', () {
      final rrule = RRule.daily();
      expect(rrule.toString(), 'RRULE:FREQ=DAILY');
    });

    test('weeklyを生成できる', () {
      final rrule = RRule.weekly(weekdays: [1, 2, 3]);
      expect(rrule.toString(), 'RRULE:FREQ=WEEKLY;BYDAY=MO,TU,WE');
    });

    test('monthlyを生成できる', () {
      final rrule = RRule.monthly(monthDays: [1, 2, 3]);
      expect(rrule.toString(), 'RRULE:FREQ=MONTHLY;BYMONTHDAY=1,2,3');
    });

    test('nextOccurrenceを取得できる', () {
      final rrule = RRule.daily();
      final nextOccurrence = rrule.nextOccurrence(DateTime.now());
      expect(nextOccurrence, isNotNull);
    });

    test('occurrencesBetweenを取得できる', () {
      final rrule = RRule.daily();
      final occurrences = rrule.occurrencesBetween(
        DateTime.now(),
        DateTime.now().add(const Duration(days: 10)),
      );
      expect(occurrences, isNotEmpty);
    });
  });
}
