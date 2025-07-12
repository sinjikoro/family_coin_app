import 'package:family_coin/presentation/ui/components/molecules/task_type_card.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/utils/routing/route_path.dart';
import 'package:widgetbook/widgetbook.dart';

@widgetbook.UseCase(
  name: 'Interactive',
  type: TaskTypeCard,
  path: WidgetbookRoutePath.molecules,
)
Widget taskTypeCardUseCase(BuildContext context) {
  final title = context.knobs.string(
    label: 'Title',
    description: 'タイトル',
    initialValue: 'ワンタイムタスク',
  );

  final subTitle = context.knobs.string(
    label: 'Sub Title',
    description: 'サブタイトル',
    initialValue: '一度だけ実行',
  );

  final description = context.knobs.string(
    label: 'Description',
    description: '説明',
    initialValue: '一度だけ実行されるタスクです',
  );

  final selected = context.knobs.boolean(
    label: 'Selected',
    description: '選択状態',
    initialValue: false,
  );

  final icon = context.knobs.list(
    label: 'Icon',
    description: 'アイコン',
    options: [Icons.task, Icons.repeat, Icons.calendar_today],
    initialOption: Icons.task,
  );

  final hasTapCallback = context.knobs.boolean(
    label: 'Has Tap Callback',
    description: 'タップコールバックを有効にする',
    initialValue: true,
  );

  return Center(
    child: TaskTypeCard(
      icon: icon,
      title: title,
      subTitle: subTitle,
      description: description,
      selected: selected,
      onTap: hasTapCallback ? () {
        debugPrint('Task type card tapped');
      } : null,
    ),
  );
}