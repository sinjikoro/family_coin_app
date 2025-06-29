import 'package:flutter/material.dart';
import 'package:family_coin/presentation/ui/components/atoms/app_text_field.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: AppTextField)
Widget defaultTextFieldUseCase(BuildContext context) {
  return const Padding(padding: EdgeInsets.all(16), child: AppTextField());
}

@widgetbook.UseCase(name: 'Name', type: AppTextField)
Widget nameTextFieldUseCase(BuildContext context) {
  return Padding(padding: const EdgeInsets.all(16), child: AppTextField.name());
}

@widgetbook.UseCase(name: 'Amount', type: AppTextField)
Widget amountTextFieldUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: AppTextField.amount(),
  );
}

@widgetbook.UseCase(name: 'Description', type: AppTextField)
Widget descriptionTextFieldUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: AppTextField.description(),
  );
}

@widgetbook.UseCase(name: 'URL', type: AppTextField)
Widget urlTextFieldUseCase(BuildContext context) {
  return Padding(padding: const EdgeInsets.all(16), child: AppTextField.url());
}
