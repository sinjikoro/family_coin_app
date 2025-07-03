import 'package:flutter/material.dart';
import 'package:family_coin/presentation/ui/components/organisms/progress_card_section.dart';
import 'package:family_coin/presentation/ui/components/organisms/models/progress_data.dart';
import 'package:family_coin/presentation/ui/components/atoms/app_icon.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: ProgressCardSection)
Widget progressCardSectionDefaultUseCase(BuildContext context) {
  return const ProgressCardSection(
    todayProgress: ProgressData(
      icon: AppIcon.calendar(size: 24),
      title: '今日のタスク',
      valueText: '3/5 完了',
    ),
    weeklyProgress: ProgressData(
      icon: AppIcon.trophy(size: 24),
      title: '今週の進捗',
      valueText: '85%',
      progress: 0.85,
    ),
  );
}

@widgetbook.UseCase(name: 'With Progress Bars', type: ProgressCardSection)
Widget progressCardSectionWithProgressUseCase(BuildContext context) {
  return const ProgressCardSection(
    todayProgress: ProgressData(
      icon: AppIcon.calendar(size: 24),
      title: '今日のタスク',
      valueText: '3/5 完了',
      progress: 0.6,
    ),
    weeklyProgress: ProgressData(
      icon: AppIcon.trophy(size: 24),
      title: '今週の進捗',
      valueText: '85%',
      progress: 0.85,
    ),
  );
}

@widgetbook.UseCase(name: 'Low Progress', type: ProgressCardSection)
Widget progressCardSectionLowProgressUseCase(BuildContext context) {
  return const ProgressCardSection(
    todayProgress: ProgressData(
      icon: AppIcon.calendar(size: 24),
      title: '今日のタスク',
      valueText: '1/5 完了',
      progress: 0.2,
    ),
    weeklyProgress: ProgressData(
      icon: AppIcon.trophy(size: 24),
      title: '今週の進捗',
      valueText: '25%',
      progress: 0.25,
    ),
  );
}

@widgetbook.UseCase(name: 'Complete Progress', type: ProgressCardSection)
Widget progressCardSectionCompleteUseCase(BuildContext context) {
  return const ProgressCardSection(
    todayProgress: ProgressData(
      icon: AppIcon.calendar(size: 24),
      title: '今日のタスク',
      valueText: '5/5 完了',
      progress: 1.0,
    ),
    weeklyProgress: ProgressData(
      icon: AppIcon.trophy(size: 24),
      title: '今週の進捗',
      valueText: '100%',
      progress: 1.0,
    ),
  );
}

@widgetbook.UseCase(name: 'Different Icons', type: ProgressCardSection)
Widget progressCardSectionDifferentIconsUseCase(BuildContext context) {
  return const ProgressCardSection(
    todayProgress: ProgressData(
      icon: AppIcon.star(size: 24),
      title: '今日の目標',
      valueText: '4/6 達成',
      progress: 0.67,
    ),
    weeklyProgress: ProgressData(
      icon: AppIcon.heart(size: 24),
      title: '今週の活動',
      valueText: '12日',
      progress: 0.9,
    ),
  );
}