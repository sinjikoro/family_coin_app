import 'package:family_coin/presentation/ui/components/molecules/calendar_header.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: CalendarHeader)
Widget calendarHeaderUseCase(BuildContext context) => 
  Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: CalendarHeader(
        yearMonth: '2024年1月',
        onPrevMonth: () {},
        onNextMonth: () {},
      ),
    ),
  );