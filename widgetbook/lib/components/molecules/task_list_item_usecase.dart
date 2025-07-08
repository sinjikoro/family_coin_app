import 'package:flutter/material.dart';
import 'package:family_coin/presentation/ui/components/molecules/task_list_item.dart';
import 'package:family_coin/presentation/ui/components/atoms/app_icon.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/utils/routing/route_path.dart';
import 'package:widgetbook/widgetbook.dart';

@widgetbook.UseCase(
  name: 'Interactive',
  type: TaskListItem,
  path: WidgetbookRoutePath.molecules,
)
Widget taskListItemUseCase(BuildContext context) {
  final labelColor = context.knobs.color(
    label: 'Label Color',
    description: 'タスクのラベル色',
    initialValue: Colors.blue,
  );

  final title = context.knobs.string(
    label: 'Title',
    description: 'タスクのタイトル',
    initialValue: 'お手伝いをする',
  );

  final subTitle = context.knobs.string(
    label: 'Subtitle',
    description: 'タスクのサブタイトル',
    initialValue: '毎日',
  );

  final coin = context.knobs.int.slider(
    label: 'Coin',
    description: '獲得コイン数',
    min: 0,
    max: 1000,
    divisions: 100,
    initialValue: 100,
  );

  final iconType = context.knobs.list(
    label: 'Icon Type',
    description: 'アイコンの種類',
    options: AppIconType.values,
    initialOption: AppIconType.bookOpen,
  );

  final iconSize = context.knobs.double.slider(
    label: 'Icon Size',
    description: 'アイコンのサイズ',
    min: 16,
    max: 96,
    divisions: 20,
    initialValue: 32,
  );

  final isDone = context.knobs.boolean(
    label: 'Is Done',
    description: 'タスク完了状態',
    initialValue: false,
  );

  final isDisabled = context.knobs.boolean(
    label: 'Is Disabled',
    description: 'タスク無効状態',
    initialValue: false,
  );

  final hasCallback = context.knobs.boolean(
    label: 'Enable Callback',
    description: 'タップコールバックを有効にする',
    initialValue: false,
  );

  return Padding(
    padding: const EdgeInsets.all(16),
    child: TaskListItem(
      labelColor: labelColor,
      title: title,
      subTitle: subTitle,
      coin: coin,
      icon: AppIcon(type: iconType, size: iconSize),
      isDone: isDone,
      isDisabled: isDisabled,
      onTap: hasCallback
          ? () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Task item tapped!')),
              );
            }
          : null,
    ),
  );
}
