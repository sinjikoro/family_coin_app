import 'package:family_coin/presentation/ui/components/molecules/calendar_header.dart';
import 'package:family_coin/presentation/ui/components/molecules/calendar_legend.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

/// カスタムカレンダーセクション
class CustomCalendarSection extends StatelessWidget {
  /// constructor
  const CustomCalendarSection({
    required this.yearMonth,
    required this.executionDays,
    required this.startDay,
    super.key,
    this.onPrevMonth,
    this.onNextMonth,
  });

  /// 年月表示テキスト
  final String yearMonth;

  /// 実行日リスト
  final List<int> executionDays;

  /// 開始日
  final int startDay;

  /// 前月ボタンコールバック
  final VoidCallback? onPrevMonth;

  /// 次月ボタンコールバック
  final VoidCallback? onNextMonth;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // カレンダーヘッダー
      CalendarHeader(
        yearMonth: yearMonth,
        onPrevMonth: onPrevMonth,
        onNextMonth: onNextMonth,
      ),
      const SizedBox(height: 8),
      // カレンダー本体
      Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: TableCalendar(
          firstDay: DateTime.now(),
          lastDay: DateTime.now().add(const Duration(days: 365)),
          focusedDay: DateTime.now(),
          selectedDayPredicate: (day) => false, // 選択機能は無効
          onDaySelected: null, // 選択機能は無効
          onFormatChanged: (format) {},
          calendarStyle: const CalendarStyle(
            outsideDaysVisible: false,
            defaultDecoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
            ),
            weekendDecoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
            ),
            todayDecoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
            ),
            selectedDecoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
            ),
            cellMargin: EdgeInsets.all(4),
          ),
          headerVisible: false, // ヘッダーは非表示（独自のヘッダーを使用）
          calendarBuilders: CalendarBuilders(
            defaultBuilder: (context, day, focusedDay) {
              final dayNumber = day.day;
              final isStart = dayNumber == startDay;
              final isExec = executionDays.contains(dayNumber);

              return Container(
                width: 36,
                height: 36,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color:
                      isStart
                          ? Colors.black
                          : isExec
                          ? Colors.blue[100]
                          : Colors.transparent,
                  border: Border.all(
                    color: isExec ? Colors.blue : Colors.transparent,
                    width: isExec ? 2 : 0,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '$dayNumber',
                  style: TextStyle(
                    color:
                        isStart
                            ? Colors.white
                            : isExec
                            ? Colors.blue[900]
                            : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          ),
        ),
      ),
      const SizedBox(height: 16),
      // 凡例
      const CalendarLegend(),
    ],
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('yearMonth', yearMonth))
      ..add(IterableProperty<int>('executionDays', executionDays))
      ..add(IntProperty('startDay', startDay));
    properties.add(
      ObjectFlagProperty<VoidCallback?>.has('onPrevMonth', onPrevMonth),
    );
    properties.add(
      ObjectFlagProperty<VoidCallback?>.has('onNextMonth', onNextMonth),
    );
  }
}
