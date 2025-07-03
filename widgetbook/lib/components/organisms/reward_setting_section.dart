import 'package:family_coin/presentation/ui/components/organisms/reward_setting_section.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Challenge Task', type: RewardSettingSection)
Widget challengeRewardSettingSectionUseCase(BuildContext context) => 
  Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: RewardSettingSection(
        taskType: 0,
        selectedCoinIndex: 1,
        onCoinSelected: (i) {},
        onCoinChanged: (v) {},
      ),
    ),
  );

@widgetbook.UseCase(name: 'Routine Task', type: RewardSettingSection)
Widget routineRewardSettingSectionUseCase(BuildContext context) => 
  Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: RewardSettingSection(
        taskType: 1,
        selectedCoinIndex: 2,
        onCoinSelected: (i) {},
        onCoinChanged: (v) {},
      ),
    ),
  );