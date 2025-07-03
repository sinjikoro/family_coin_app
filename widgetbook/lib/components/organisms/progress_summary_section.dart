import 'package:flutter/material.dart';
import 'package:family_coin/presentation/ui/components/organisms/progress_summary_section.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: ProgressSummarySection)
Widget progressSummarySectionUseCase(BuildContext context) {
  return const ProgressSummarySection(
    doneCount: 3,
    remainCount: 2,
    totalCount: 5,
    doneCoin: 130,
    remainCoin: 80,
  );
}

@widgetbook.UseCase(name: 'All Completed', type: ProgressSummarySection)
Widget progressSummarySectionAllCompletedUseCase(BuildContext context) {
  return const ProgressSummarySection(
    doneCount: 5,
    remainCount: 0,
    totalCount: 5,
    doneCoin: 250,
    remainCoin: 0,
  );
}

@widgetbook.UseCase(name: 'No Progress', type: ProgressSummarySection)
Widget progressSummarySectionNoProgressUseCase(BuildContext context) {
  return const ProgressSummarySection(
    doneCount: 0,
    remainCount: 3,
    totalCount: 3,
    doneCoin: 0,
    remainCoin: 150,
  );
}

@widgetbook.UseCase(name: 'Large Numbers', type: ProgressSummarySection)
Widget progressSummarySectionLargeNumbersUseCase(BuildContext context) {
  return const ProgressSummarySection(
    doneCount: 15,
    remainCount: 8,
    totalCount: 23,
    doneCoin: 750,
    remainCoin: 400,
  );
}
