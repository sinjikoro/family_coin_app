import 'package:family_coin/presentation/ui/components/organisms/challenge_task_section.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: ChallengeTaskSection)
Widget challengeTaskSectionUseCase(BuildContext context) => 
  Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: ChallengeTaskSection(
        difficulties: ['かんたん', 'ふつう', 'むずかしい'],
        selectedDifficulty: 'ふつう',
        condition: '',
        onDifficultySelected: (d) {},
        onConditionChanged: (v) {},
      ),
    ),
  );