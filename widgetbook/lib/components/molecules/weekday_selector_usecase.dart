import 'package:family_coin/presentation/ui/components/molecules/weekday_selector.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/utils/routing/route_path.dart';
import 'package:widgetbook/widgetbook.dart';

@widgetbook.UseCase(
  name: 'Interactive',
  type: WeekdaySelector,
  path: WidgetbookRoutePath.molecules,
)
Widget weekdaySelectorUseCase(BuildContext context) {
  final selectedWeekdays = [
    context.knobs.boolean(
      label: 'Sunday',
      description: '日曜日',
      initialValue: false,
    ),
    context.knobs.boolean(
      label: 'Monday',
      description: '月曜日',
      initialValue: true,
    ),
    context.knobs.boolean(
      label: 'Tuesday',
      description: '火曜日',
      initialValue: true,
    ),
    context.knobs.boolean(
      label: 'Wednesday',
      description: '水曜日',
      initialValue: true,
    ),
    context.knobs.boolean(
      label: 'Thursday',
      description: '木曜日',
      initialValue: true,
    ),
    context.knobs.boolean(
      label: 'Friday',
      description: '金曜日',
      initialValue: true,
    ),
    context.knobs.boolean(
      label: 'Saturday',
      description: '土曜日',
      initialValue: false,
    ),
  ];

  return Center(
    child: WeekdaySelector(
      selectedWeekdays: selectedWeekdays,
      onChanged: (index) {
        debugPrint('Weekday $index toggled');
      },
    ),
  );
}