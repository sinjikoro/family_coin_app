import 'package:family_coin/presentation/ui/components/molecules/calendar_header.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/utils/routing/route_path.dart';
import 'package:widgetbook/widgetbook.dart';

@widgetbook.UseCase(
  name: 'Interactive',
  type: CalendarHeader,
  path: WidgetbookRoutePath.molecules,
)
Widget calendarHeaderUseCase(BuildContext context) {
  final yearMonth = context.knobs.string(
    label: 'Year Month',
    description: '年月表示テキスト',
    initialValue: '2024年7月',
  );

  final hasPrevButton = context.knobs.boolean(
    label: 'Has Prev Button',
    description: '前月ボタンを有効にする',
    initialValue: true,
  );

  final hasNextButton = context.knobs.boolean(
    label: 'Has Next Button',
    description: '次月ボタンを有効にする',
    initialValue: true,
  );

  return Center(
    child: CalendarHeader(
      yearMonth: yearMonth,
      onPrevMonth: hasPrevButton ? () {} : null,
      onNextMonth: hasNextButton ? () {} : null,
    ),
  );
}