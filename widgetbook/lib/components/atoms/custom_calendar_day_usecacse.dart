import 'package:family_coin/presentation/ui/components/atoms/custom_calendar_day.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/utils/routing/route_path.dart';

@widgetbook.UseCase(
  name: 'Start Day',
  type: CustomCalendarDay,
  path: WidgetbookRoutePath.atoms,
)
Widget startDayUseCase(BuildContext context) => Scaffold(
  body: Center(child: CustomCalendarDay(day: 15, isStart: true, isExec: false)),
);

@widgetbook.UseCase(
  name: 'Execution Day',
  type: CustomCalendarDay,
  path: WidgetbookRoutePath.atoms,
)
Widget executionDayUseCase(BuildContext context) => Scaffold(
  body: Center(child: CustomCalendarDay(day: 17, isStart: false, isExec: true)),
);

@widgetbook.UseCase(
  name: 'Normal Day',
  type: CustomCalendarDay,
  path: WidgetbookRoutePath.atoms,
)
Widget normalDayUseCase(BuildContext context) => Scaffold(
  body: Center(
    child: CustomCalendarDay(day: 10, isStart: false, isExec: false),
  ),
);
