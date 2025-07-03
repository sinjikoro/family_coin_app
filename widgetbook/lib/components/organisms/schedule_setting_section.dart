import 'package:family_coin/presentation/ui/components/organisms/schedule_setting_section.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Daily', type: ScheduleSettingSection)
Widget dailyScheduleSettingSectionUseCase(BuildContext context) => 
  Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: ScheduleSettingSection(
        scheduleFrequency: 0,
        selectedWeekdays: [true, true, true, true, true, false, false],
        onFrequencyChanged: (i) {},
        onWeekdayChanged: (i) {},
      ),
    ),
  );

@widgetbook.UseCase(name: 'Weekly', type: ScheduleSettingSection)
Widget weeklyScheduleSettingSectionUseCase(BuildContext context) => 
  Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: ScheduleSettingSection(
        scheduleFrequency: 1,
        selectedWeekdays: [true, true, true, true, true, false, false],
        onFrequencyChanged: (i) {},
        onWeekdayChanged: (i) {},
      ),
    ),
  );

@widgetbook.UseCase(name: 'Custom', type: ScheduleSettingSection)
Widget customScheduleSettingSectionUseCase(BuildContext context) => 
  Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: ScheduleSettingSection(
        scheduleFrequency: 2,
        selectedWeekdays: [true, true, true, true, true, false, false],
        onFrequencyChanged: (i) {},
        onWeekdayChanged: (i) {},
      ),
    ),
  );