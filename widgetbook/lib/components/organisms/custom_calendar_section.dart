import 'package:family_coin/presentation/ui/components/organisms/custom_calendar_section.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: CustomCalendarSection)
Widget customCalendarSectionUseCase(BuildContext context) => 
  Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: CustomCalendarSection(
        yearMonth: '2024年1月',
        executionDays: [15, 17, 19, 21, 23, 25, 27, 29, 31],
        startDay: 15,
        onPrevMonth: () {},
        onNextMonth: () {},
      ),
    ),
  );