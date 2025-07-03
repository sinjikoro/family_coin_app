import 'package:flutter/material.dart';
import 'package:family_coin/presentation/ui/components/molecules/history_list_item.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class HistoryListItemWidgetbook extends StatelessWidget {
  const HistoryListItemWidgetbook({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: HistoryListItem(title: 'アイスクリーム', subtitle: '3日前に交換・50コイン使用'),
    );
  }
}

@widgetbook.UseCase(name: 'Default', type: HistoryListItem)
Widget historyListItemDefaultUseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16),
    child: HistoryListItem(title: 'アイスクリーム', subtitle: '3日前に交換・50コイン使用'),
  );
}

@widgetbook.UseCase(name: 'With Custom Icon', type: HistoryListItem)
Widget historyListItemCustomIconUseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16),
    child: HistoryListItem(
      title: '好きな夕食',
      subtitle: '昨日に交換・100コイン使用',
      icon: Icons.dinner_dining,
      backgroundColor: Colors.yellow,
    ),
  );
}
