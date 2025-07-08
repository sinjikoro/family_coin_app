import 'package:flutter/material.dart';
import 'package:family_coin/presentation/ui/components/molecules/progress_card.dart';
import 'package:family_coin/presentation/ui/components/atoms/app_icon.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/utils/routing/route_path.dart';
import 'package:widgetbook/widgetbook.dart';

@widgetbook.UseCase(
  name: 'Interactive',
  type: ProgressCard,
  path: WidgetbookRoutePath.molecules,
)
Widget progressCardUseCase(BuildContext context) {
  final iconType = context.knobs.list(
    label: 'Icon Type',
    description: 'アイコンの種類',
    options: AppIconType.values,
    initialOption: AppIconType.calendar,
  );

  final title = context.knobs.string(
    label: 'Title',
    description: 'カードのタイトル',
    initialValue: '今日のタスク',
  );

  final valueText = context.knobs.string(
    label: 'Value Text',
    description: '値のテキスト',
    initialValue: '3/5 完了',
  );

  final subText = context.knobs.string(
    label: 'Sub Text',
    description: 'サブテキスト（空文字で非表示）',
    initialValue: '',
  );

  final showProgress = context.knobs.boolean(
    label: 'Show Progress',
    description: 'プログレスバーを表示する',
    initialValue: false,
  );

  final progress = showProgress
      ? context.knobs.double.slider(
          label: 'Progress',
          description: 'プログレス値（0.0-1.0）',
          min: 0.0,
          max: 1.0,
          divisions: 10,
          initialValue: 0.85,
        )
      : null;

  return Padding(
    padding: const EdgeInsets.all(16),
    child: ProgressCard(
      icon: AppIcon(type: iconType, size: 24),
      title: title,
      valueText: valueText,
      subText: subText.isEmpty ? null : subText,
      progress: progress,
    ),
  );
}
