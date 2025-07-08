import 'package:family_coin/presentation/ui/components/atoms/custom_calendar_day.dart';
import 'package:family_coin/presentation/ui/components/molecules/calendar_header.dart';
import 'package:family_coin/presentation/ui/components/molecules/calendar_legend.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// カスタムカレンダーセクション
class CustomCalendarSection extends StatelessWidget {

  /// constructor
  const CustomCalendarSection({
    required this.yearMonth, required this.executionDays, required this.startDay, super.key,
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
        child: Column(
          children: [
            // 曜日ヘッダー
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('日', style: TextStyle(color: Colors.red)),
                Text('月'),
                Text('火'),
                Text('水'),
                Text('木'),
                Text('金'),
                Text('土', style: TextStyle(color: Colors.blue)),
              ],
            ),
            const SizedBox(height: 8),
            // 日付グリッド
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (int i = 1; i <= 31; i++)
                  CustomCalendarDay(
                    day: i,
                    isStart: i == startDay,
                    isExec: executionDays.contains(i),
                  ),
              ],
            ),
          ],
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
      properties.add(ObjectFlagProperty<VoidCallback?>.has('onPrevMonth', onPrevMonth));
      properties.add(ObjectFlagProperty<VoidCallback?>.has('onNextMonth', onNextMonth));
  }
}