import 'package:family_coin/presentation/ui/components/molecules/history_list_item.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/utils/routing/route_path.dart';
import 'package:widgetbook/widgetbook.dart';

@widgetbook.UseCase(
  name: 'Interactive',
  type: HistoryListItem,
  path: WidgetbookRoutePath.molecules,
)
Widget historyListItemUseCase(BuildContext context) {
  final title = context.knobs.string(
    label: 'Title',
    description: 'タイトル',
    initialValue: 'タスク完了',
  );

  final subtitle = context.knobs.string(
    label: 'Subtitle',
    description: 'サブタイトル',
    initialValue: '部屋の掃除を完了しました',
  );

  final icon = context.knobs.list(
    label: 'Icon',
    description: 'アイコン',
    options: [Icons.check_circle, Icons.star, Icons.favorite],
    initialOption: Icons.check_circle,
  );

  final hasBackgroundColor = context.knobs.boolean(
    label: 'Has Background Color',
    description: '背景色を設定する',
    initialValue: false,
  );

  return Center(
    child: HistoryListItem(
      title: title,
      subtitle: subtitle,
      icon: icon,
      backgroundColor: hasBackgroundColor ? Colors.blue.shade50 : null,
    ),
  );
}