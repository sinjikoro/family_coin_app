import 'package:flutter/material.dart';
import 'package:family_coin/presentation/ui/components/atoms/tappable_editable_text.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/utils/routing/route_path.dart';

@widgetbook.UseCase(
  name: 'Default',
  type: TappableEditableText,
  path: WidgetbookRoutePath.atoms,
)
Widget buildCoolButtonUseCase1(BuildContext context) {
  return TappableEditableText(text: 'Default', onChanged: (value) {});
}

@widgetbook.UseCase(
  name: 'Hello',
  type: TappableEditableText,
  path: WidgetbookRoutePath.atoms,
)
Widget buildCoolButtonUseCase2(BuildContext context) {
  return TappableEditableText(text: 'Hello', onChanged: (value) {});
}

@widgetbook.UseCase(
  name: 'GoodBye',
  type: TappableEditableText,
  path: WidgetbookRoutePath.atoms,
)
Widget buildCoolButtonUseCase3(BuildContext context) {
  return TappableEditableText(text: 'GoodBye', onChanged: (value) {});
}
