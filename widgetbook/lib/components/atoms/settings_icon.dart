import 'package:flutter/material.dart';
import 'package:family_coin/presentation/ui/components/atoms/settings_icon.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: SettingsIcon)
Widget settingsIconDefaultUseCase(BuildContext context) {
  return const Padding(padding: EdgeInsets.all(16), child: SettingsIcon());
}

@widgetbook.UseCase(name: 'Large', type: SettingsIcon)
Widget settingsIconLargeUseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16),
    child: SettingsIcon(size: 32),
  );
}
