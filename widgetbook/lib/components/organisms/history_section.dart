import 'package:flutter/material.dart';
import 'package:family_coin/presentation/ui/components/organisms/history_section.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: HistorySection)
Widget historySectionDefaultUseCase(BuildContext context) {
  final historyList = [
    {'title': 'アイスクリーム', 'date': '3日前', 'coin': 50},
    {'title': 'ゲーム30分', 'date': '1週間前', 'coin': 30},
  ];
  return Padding(
    padding: const EdgeInsets.all(16),
    child: HistorySection(historyList: historyList, onSeeAll: () {}),
  );
}
