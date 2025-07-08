import 'package:flutter/material.dart';
import 'package:family_coin/presentation/ui/components/atoms/app_icon.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/utils/routing/route_path.dart';
import 'package:widgetbook/widgetbook.dart';

@widgetbook.UseCase(
  name: 'Interactive',
  type: AppIcon,
  path: WidgetbookRoutePath.atoms,
)
Widget appIconInteractiveUseCase(BuildContext context) {
  final selectedIconType = context.knobs.list(
    label: 'Icon Type',
    description: '表示するアイコンの種類',
    options: AppIconType.values,
    initialOption: AppIconType.calendar,
  );

  final selectedSize = context.knobs.double.slider(
    label: 'Size',
    description: 'アイコンのサイズ',
    min: 4.0,
    max: 64.0,
    divisions: 15,
    initialValue: 24.0,
  );

  final selectedColor = context.knobs.color(
    label: 'Color',
    description: 'アイコンの色',
    initialValue: Colors.black,
  );

  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // 選択されたアイコンを大きく表示
        AppIcon(
          type: selectedIconType,
          size: selectedSize,
          color: selectedColor,
        ),
        const SizedBox(height: 32),
        // 全アイコンを一覧表示
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: AppIconType.values
              .map((iconType) => AppIcon(type: iconType, size: 24))
              .toList(),
        ),
      ],
    ),
  );
}
