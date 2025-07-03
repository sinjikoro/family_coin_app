import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:family_coin/presentation/ui/components/molecules/schedule_frequency_selector.dart';
import 'package:family_coin/presentation/ui/components/molecules/weekday_selector.dart';
import 'package:family_coin/presentation/ui/components/organisms/schedule_summary_box.dart';
import 'package:family_coin/presentation/ui/components/organisms/custom_calendar_section.dart';
import 'package:family_coin/presentation/ui/components/organisms/custom_schedule_bottom_sheet.dart';

/// スケジュール設定セクション
class ScheduleSettingSection extends StatelessWidget {
  /// スケジュール頻度（0:毎日, 1:毎週, 2:カスタム）
  final int scheduleFrequency;

  /// 選択された曜日
  final List<bool> selectedWeekdays;

  /// スケジュール頻度変更コールバック
  final ValueChanged<int> onFrequencyChanged;

  /// 曜日選択コールバック
  final ValueChanged<int> onWeekdayChanged;

  /// constructor
  const ScheduleSettingSection({
    super.key,
    required this.scheduleFrequency,
    required this.selectedWeekdays,
    required this.onFrequencyChanged,
    required this.onWeekdayChanged,
  });

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.blue[50],
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ヘッダー
        Row(
          children: const [
            Icon(Icons.repeat, color: Colors.blue),
            SizedBox(width: 8),
            Text(
              'スケジュール設定',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 8),
        // 頻度選択
        const Text('頻度'),
        ScheduleFrequencySelector(
          selectedIndex: scheduleFrequency,
          onChanged: (i) async {
            if (i == 2) {
              // カスタム選択時にボトムシートを表示
              await showModalBottomSheet<void>(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(24),
                  ),
                ),
                builder: (context) => const CustomScheduleBottomSheet(),
              );
            }
            onFrequencyChanged(i);
          },
        ),
        // 毎週選択時の曜日選択
        if (scheduleFrequency == 1) ...[
          const SizedBox(height: 16),
          const Text('曜日を選択'),
          WeekdaySelector(
            selectedWeekdays: selectedWeekdays,
            onChanged: onWeekdayChanged,
          ),
          const SizedBox(height: 16),
          ScheduleSummaryBox(selectedWeekdays: selectedWeekdays),
        ],
        // カスタム選択時のカレンダー
        if (scheduleFrequency == 2) ...[
          const SizedBox(height: 16),
          // スケジュール概要
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.green[50],
              border: Border.all(color: Colors.green.shade200),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Row(
                  children: [
                    Icon(Icons.calendar_today, color: Colors.green),
                    SizedBox(width: 8),
                    Text(
                      'スケジュール概要',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text('2日ごと'),
              ],
            ),
          ),
          const SizedBox(height: 24),
          // カスタムカレンダー
          CustomCalendarSection(
            yearMonth: '2024年1月',
            executionDays: [15, 17, 19, 21, 23, 25, 27, 29, 31],
            startDay: 15,
          ),
        ],
      ],
    ),
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(IntProperty('scheduleFrequency', scheduleFrequency))
      ..add(IterableProperty<bool>('selectedWeekdays', selectedWeekdays));
  }
}