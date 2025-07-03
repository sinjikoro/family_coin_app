import 'package:flutter/material.dart';
import 'package:family_coin/presentation/ui/components/atoms/app_tab_button.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Selected', type: AppTabButton)
Widget appTabButtonSelectedUseCase(BuildContext context) {
  return const Center(
    child: AppTabButton(label: '選択済み', selected: true, onTap: null),
  );
}

@widgetbook.UseCase(name: 'Unselected', type: AppTabButton)
Widget appTabButtonUnselectedUseCase(BuildContext context) {
  return const Center(
    child: AppTabButton(label: '未選択', selected: false, onTap: null),
  );
}

@widgetbook.UseCase(name: 'With Callback', type: AppTabButton)
Widget appTabButtonWithCallbackUseCase(BuildContext context) {
  return Center(
    child: AppTabButton(
      label: 'タップ可能',
      selected: false,
      onTap: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Tab button tapped!')));
      },
    ),
  );
}
