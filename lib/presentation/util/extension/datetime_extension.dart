/// DateTimeの拡張
extension DatetimeExtension on DateTime {
  /// 同じ日付であるか
  bool isSameDay(DateTime datetime) =>
      year == datetime.year && month == datetime.month && day == datetime.day;

  /// 週番号を取得
  int get weekOfMonth => (day - 1) ~/ 7 + 1;

  /// 最終週であるか
  bool get isLastWeek => month != add(const Duration(days: 7)).month;
}
