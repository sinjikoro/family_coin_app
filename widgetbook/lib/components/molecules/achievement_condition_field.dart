import 'package:family_coin/presentation/ui/components/molecules/achievement_condition_field.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: AchievementConditionField)
Widget achievementConditionFieldUseCase(BuildContext context) => 
  Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: AchievementConditionField(
        condition: '',
        onChanged: (v) {},
      ),
    ),
  );