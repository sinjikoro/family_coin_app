import 'package:family_coin/presentation/ui/components/molecules/icon_choice_row.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/utils/routing/route_path.dart';
import 'package:widgetbook/widgetbook.dart';

@widgetbook.UseCase(
  name: 'Interactive',
  type: IconChoiceRow,
  path: WidgetbookRoutePath.molecules,
)
Widget iconChoiceRowUseCase(BuildContext context) {
  final icons = [
    Icons.home,
    Icons.work,
    Icons.school,
    Icons.shopping_cart,
    Icons.fitness_center,
  ];
  
  final selectedIndex = context.knobs.int.slider(
    label: 'Selected Index',
    description: '選択されたアイコンのインデックス',
    initialValue: 0,
    min: 0,
    max: icons.length - 1,
  );

  return Center(
    child: IconChoiceRow(
      icons: icons,
      selectedIndex: selectedIndex,
      onSelected: (index) {
        debugPrint('Selected icon index: $index');
      },
    ),
  );
}