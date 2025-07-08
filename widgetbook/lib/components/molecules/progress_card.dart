import 'package:flutter/material.dart';
import 'package:family_coin/presentation/ui/components/molecules/progress_card.dart';
import 'package:family_coin/presentation/ui/components/atoms/app_icon.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: '今日のタスク', type: ProgressCard)
Widget progressCardTodayTaskUseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16),
    child: ProgressCard(
      icon: AppIcon(type: AppIconType.calendar, size: 24),
      title: '今日のタスク',
      valueText: '3/5 完了',
      subText: null,
      progress: null,
    ),
  );
}

@widgetbook.UseCase(name: '今週の進捗', type: ProgressCard)
Widget progressCardWeeklyUseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16),
    child: ProgressCard(
      icon: AppIcon(type: AppIconType.trophy, size: 24),
      title: '今週の進捗',
      valueText: '85%',
      subText: null,
      progress: 0.85,
    ),
  );
}
