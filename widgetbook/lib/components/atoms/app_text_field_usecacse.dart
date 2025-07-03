import 'package:flutter/material.dart';
import 'package:family_coin/presentation/ui/components/atoms/app_text_field.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/utils/routing/route_path.dart';

@widgetbook.UseCase(
  name: 'Default',
  type: AppTextField,
  path: WidgetbookRoutePath.atoms,
)
Widget defaultTextFieldUseCase(BuildContext context) {
  return const Padding(padding: EdgeInsets.all(16), child: AppTextField());
}

@widgetbook.UseCase(
  name: 'Name',
  type: AppTextField,
  path: WidgetbookRoutePath.atoms,
)
Widget nameTextFieldUseCase(BuildContext context) {
  return Padding(padding: const EdgeInsets.all(16), child: AppTextField.name());
}

@widgetbook.UseCase(
  name: 'Amount',
  type: AppTextField,
  path: WidgetbookRoutePath.atoms,
)
Widget amountTextFieldUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: AppTextField.amount(),
  );
}

@widgetbook.UseCase(
  name: 'Description',
  type: AppTextField,
  path: WidgetbookRoutePath.atoms,
)
Widget descriptionTextFieldUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: AppTextField.description(),
  );
}

@widgetbook.UseCase(
  name: 'URL',
  type: AppTextField,
  path: WidgetbookRoutePath.atoms,
)
Widget urlTextFieldUseCase(BuildContext context) {
  return Padding(padding: const EdgeInsets.all(16), child: AppTextField.url());
}
