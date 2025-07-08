import 'package:family_coin/presentation/ui/components/molecules/category_choice_chips.dart';
import 'package:family_coin/presentation/ui/components/organisms/challenge_task_section.dart';
import 'package:family_coin/presentation/ui/components/organisms/preview_section.dart';
import 'package:family_coin/presentation/ui/components/organisms/reward_setting_section.dart';
import 'package:family_coin/presentation/ui/components/organisms/schedule_setting_section.dart';
import 'package:family_coin/presentation/ui/components/organisms/task_form_section.dart';
import 'package:family_coin/presentation/ui/components/organisms/task_type_selector_section.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// タスク設定ページ
class TaskSettingPage extends StatefulWidget {
  /// コンストラクタ
  const TaskSettingPage({super.key});

  @override
  State<TaskSettingPage> createState() => _TaskSettingPageState();
}

class _TaskSettingPageState extends State<TaskSettingPage> {
  /// タスク種別選択
  int selectedTaskType = 0;

  /// カテゴリ選択
  int selectedCategory = 0;

  /// アイコン選択
  int selectedIcon = 0;

  /// コイン数選択
  int selectedCoin = 1;

  /// タスク名
  String taskName = '';

  /// 説明
  String description = '';

  /// 難易度
  String difficulty = 'かんたん';

  /// スケジュール頻度
  int scheduleFrequency = 0; // 0:毎日, 1:毎週, 2:カスタム

  /// 曜日選択（毎週/カスタム時のみ有効）
  List<bool> selectedWeekdays = [
    true,
    true,
    true,
    true,
    true,
    false,
    false,
  ]; // 月〜日

  /// カテゴリ
  final categories = ['挑戦', '勉強', '運動', '生活'];

  /// アイコン
  final List<IconData> icons = [
    Icons.emoji_events,
    Icons.directions_bike,
    Icons.star,
    Icons.camera_alt,
    Icons.book,
    Icons.favorite,
  ];

  /// コイン数
  final coinAmounts = [50, 100, 200, 500];

  /// 難易度
  final difficulties = ['かんたん', 'ふつう', 'むずかしい'];

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('タスク設定'),
      actions: [
        TextButton(
          onPressed: () {},
          child: const Text('保存', style: TextStyle(color: Colors.white)),
        ),
      ],
    ),
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // タスク種別選択
          TaskTypeSelectorSection(
            selectedIndex: selectedTaskType,
            onSelected: (i) => setState(() => selectedTaskType = i),
          ),
          const SizedBox(height: 24),
          // タスクフォーム
          TaskFormSection(
            taskType: selectedTaskType,
            taskName: taskName,
            description: description,
            onTaskNameChanged: (v) => setState(() => taskName = v),
            onDescriptionChanged: (v) => setState(() => description = v),
          ),
          const SizedBox(height: 16),
          // カテゴリ
          const Text('カテゴリ'),
          CategoryChoiceChips(
            categories: const ['勉強', '運動', '生活'],
            selectedIndex: selectedCategory,
            onSelected: (i) => setState(() => selectedCategory = i),
          ),
          const SizedBox(height: 16),
          // 報酬設定
          RewardSettingSection(
            taskType: selectedTaskType,
            selectedCoinIndex: selectedCoin,
            onCoinSelected: (i) => setState(() => selectedCoin = i),
            onCoinChanged: (v) {},
          ),
          const SizedBox(height: 24),
          // チャレンジタスク設定 or スケジュール設定
          if (selectedTaskType == 0) ...[
            // チャレンジタスク設定
            ChallengeTaskSection(
              difficulties: difficulties,
              selectedDifficulty: difficulty,
              condition: '',
              onDifficultySelected: (d) => setState(() => difficulty = d),
              onConditionChanged: (v) {},
            ),
          ] else ...[
            // スケジュール設定
            ScheduleSettingSection(
              scheduleFrequency: scheduleFrequency,
              selectedWeekdays: selectedWeekdays,
              onFrequencyChanged: (i) => setState(() => scheduleFrequency = i),
              onWeekdayChanged: (i) => setState(() => selectedWeekdays[i] = !selectedWeekdays[i]),
            ),
          ],
          // プレビュー
          PreviewSection(
            title:
                taskName.isEmpty
                    ? (selectedTaskType == 0 ? '自転車に初めて乗る' : '宿題をする')
                    : taskName,
            subTitle:
                description.isEmpty
                    ? (selectedTaskType == 0
                        ? '補助輪なしで自転車に乗れるようになる'
                        : '算数と国語の宿題を完了する')
                    : description,
            icon: Icons.emoji_events,
            category: ['勉強', '運動', '生活'][selectedCategory],
            difficulty: selectedTaskType == 0 ? difficulty : null,
            coin:
                selectedTaskType == 0
                    ? [50, 100, 200, 500][selectedCoin]
                    : [20, 30, 50, 100][selectedCoin],
          ),
        ],
      ),
    ),
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(IntProperty('selectedTaskType', selectedTaskType))
      ..add(IntProperty('selectedCategory', selectedCategory))
      ..add(IntProperty('selectedIcon', selectedIcon))
      ..add(IntProperty('selectedCoin', selectedCoin))
      ..add(StringProperty('taskName', taskName))
      ..add(StringProperty('description', description))
      ..add(StringProperty('difficulty', difficulty))
      ..add(IterableProperty<String>('categories', categories))
      ..add(IterableProperty<int>('coinAmounts', coinAmounts))
      ..add(IterableProperty<String>('difficulties', difficulties))
      ..add(IterableProperty<IconData>('icons', icons));
      properties.add(IntProperty('scheduleFrequency', scheduleFrequency));
      properties.add(IterableProperty<bool>('selectedWeekdays', selectedWeekdays));
  }
}

