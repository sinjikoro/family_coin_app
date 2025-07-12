import 'package:family_coin/presentation/ui/components/atoms/app_icon.dart';
import 'package:family_coin/presentation/ui/components/molecules/value_display_card.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/utils/routing/route_path.dart';
import 'package:widgetbook/widgetbook.dart';

@widgetbook.UseCase(
  name: 'Interactive',
  type: ValueDisplayCard,
  path: WidgetbookRoutePath.molecules,
)
Widget valueDisplayCardUseCase(BuildContext context) {
  final value = context.knobs.string(
    label: 'Value',
    description: '表示値',
    initialValue: '1,234',
  );

  final iconType = context.knobs.list(
    label: 'Icon Type',
    description: 'アイコン種別',
    options: [AppIconType.coin, AppIconType.star, AppIconType.trendingUp],
    initialOption: AppIconType.coin,
  );

  final iconSize = context.knobs.double.slider(
    label: 'Icon Size',
    description: 'アイコンサイズ',
    initialValue: 24.0,
    min: 16.0,
    max: 48.0,
  );

  final changeValue = context.knobs.string(
    label: 'Change Value',
    description: '変動値',
    initialValue: '+100',
  );

  final changeIconType = context.knobs.list(
    label: 'Change Icon Type',
    description: '変動アイコン種別',
    options: [AppIconType.arrowUp, AppIconType.trendingUp],
    initialOption: AppIconType.arrowUp,
  );

  final changeIconSize = context.knobs.double.slider(
    label: 'Change Icon Size',
    description: '変動アイコンサイズ',
    initialValue: 16.0,
    min: 12.0,
    max: 24.0,
  );

  final changeColor = context.knobs.list(
    label: 'Change Color',
    description: '変動色',
    options: [Colors.green, Colors.red, Colors.blue],
    initialOption: Colors.green,
  );

  return Center(
    child: ValueDisplayCard(
      icon: AppIcon(
        type: iconType,
        size: iconSize,
      ),
      value: value,
      changeValue: changeValue,
      changeIcon: AppIcon(
        type: changeIconType,
        size: changeIconSize,
      ),
      changeColor: changeColor,
    ),
  );
}