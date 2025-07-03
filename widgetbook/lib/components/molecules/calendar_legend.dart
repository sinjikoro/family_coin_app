import 'package:family_coin/presentation/ui/components/molecules/calendar_legend.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: CalendarLegend)
Widget calendarLegendUseCase(BuildContext context) => 
  Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: const CalendarLegend(),
    ),
  );