import 'package:flutter/material.dart';
import 'package:family_coin/presentation/ui/components/molecules/progress_summary_card.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Completed Tasks', type: ProgressSummaryCard)
Widget progressSummaryCardCompletedUseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16),
    child: ProgressSummaryCard(
      title: '完了',
      valueText: '3タスク',
      subText: '130コイン獲得',
      color: Colors.green,
    ),
  );
}

@widgetbook.UseCase(name: 'Remaining Tasks', type: ProgressSummaryCard)
Widget progressSummaryCardRemainingUseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16),
    child: ProgressSummaryCard(
      title: '残り',
      valueText: '2タスク',
      subText: '80コイン予定',
      color: Colors.blue,
    ),
  );
}

@widgetbook.UseCase(name: 'Total Progress', type: ProgressSummaryCard)
Widget progressSummaryCardTotalUseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16),
    child: ProgressSummaryCard(
      title: '総進捗',
      valueText: '60%',
      subText: '5タスク中3タスク完了',
      color: Colors.purple,
    ),
  );
}
