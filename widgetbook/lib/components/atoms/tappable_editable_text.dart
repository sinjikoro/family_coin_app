import 'package:flutter/material.dart';
import 'package:family_coin_app/presentation/ui/common/widgets/tappable_editable_text.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: TappableEditableText)
Widget buildCoolButtonUseCase1(BuildContext context) {
  return TappableEditableText(text: 'Default', onChanged: (value) {});
}

@widgetbook.UseCase(name: 'Hello', type: TappableEditableText)
Widget buildCoolButtonUseCase2(BuildContext context) {
  return TappableEditableText(text: 'Hello', onChanged: (value) {});
}

@widgetbook.UseCase(name: 'GoodBye', type: TappableEditableText)
Widget buildCoolButtonUseCase3(BuildContext context) {
  return TappableEditableText(text: 'GoodBye', onChanged: (value) {});
}
