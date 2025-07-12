import 'package:family_coin/presentation/ui/components/molecules/preview_card.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/utils/routing/route_path.dart';
import 'package:widgetbook/widgetbook.dart';

@widgetbook.UseCase(
  name: 'Interactive',
  type: PreviewCard,
  path: WidgetbookRoutePath.molecules,
)
Widget previewCardUseCase(BuildContext context) {
  final title = context.knobs.string(
    label: 'Title',
    description: 'タイトル',
    initialValue: 'サンプルタスク',
  );

  final subTitle = context.knobs.string(
    label: 'Sub Title',
    description: 'サブタイトル',
    initialValue: 'このタスクの説明です',
  );

  final category = context.knobs.string(
    label: 'Category',
    description: 'カテゴリ',
    initialValue: '日課',
  );

  final coin = context.knobs.int.slider(
    label: 'Coin',
    description: 'コイン',
    initialValue: 10,
    min: 1,
    max: 100,
  );

  final icon = context.knobs.list(
    label: 'Icon',
    description: 'アイコン',
    options: [Icons.home, Icons.work, Icons.school],
    initialOption: Icons.home,
  );

  final difficulty = context.knobs.string(
    label: 'Difficulty',
    description: '難易度',
    initialValue: '簡単',
  );

  final hasBackgroundColor = context.knobs.boolean(
    label: 'Has Background Color',
    description: '背景色を設定する',
    initialValue: false,
  );

  return Center(
    child: PreviewCard(
      title: title,
      subTitle: subTitle,
      icon: icon,
      category: category,
      coin: coin,
      difficulty: difficulty,
      backgroundColor: hasBackgroundColor ? Colors.blue.shade50 : null,
    ),
  );
}