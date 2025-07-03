import 'package:family_coin/presentation/ui/components/molecules/difficulty_selector.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: DifficultySelector)
Widget difficultySelectorUseCase(BuildContext context) => 
  Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: DifficultySelector(
        difficulties: ['かんたん', 'ふつう', 'むずかしい'],
        selectedDifficulty: 'ふつう',
        onSelected: (d) {},
      ),
    ),
  );