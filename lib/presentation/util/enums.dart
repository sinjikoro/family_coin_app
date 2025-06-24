/// 曜日
enum WeekDay {
  /// 月曜日
  monday(1),

  /// 火曜日
  tuesday(2),

  /// 水曜日
  wednesday(3),

  /// 木曜日
  thursday(4),

  /// 金曜日
  friday(5),

  /// 土曜日
  saturday(6),

  /// 日曜日
  sunday(7);

  /// 曜日を取得
  const WeekDay(this.value);

  /// 曜日の値
  final int value;

  /// 曜日を取得
  static WeekDay fromValue(int value) =>
      WeekDay.values.firstWhere((e) => e.value == value);
}
