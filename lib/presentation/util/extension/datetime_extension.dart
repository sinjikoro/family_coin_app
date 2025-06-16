/// DateTimeの拡張
extension DatetimeExtension on DateTime {
  /// 同じ日付であるか判定
  bool isSameDay(DateTime datetime) =>
      year == datetime.year && month == datetime.month && day == datetime.day;
}
