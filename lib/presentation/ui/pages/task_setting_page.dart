import 'package:family_coin/presentation/ui/components/molecules/category_choice_chips.dart';
import 'package:family_coin/presentation/ui/components/molecules/coin_amount_selector.dart';
import 'package:family_coin/presentation/ui/components/organisms/preview_section.dart';
import 'package:family_coin/presentation/ui/components/organisms/task_type_selector_section.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:family_coin/presentation/ui/components/organisms/schedule_summary_box.dart';
import 'package:family_coin/presentation/ui/components/molecules/weekday_selector.dart';
import 'package:family_coin/presentation/ui/components/molecules/schedule_frequency_selector.dart';
import 'package:family_coin/presentation/ui/components/atoms/app_text_field.dart';
import 'package:family_coin/presentation/ui/components/organisms/custom_schedule_bottom_sheet.dart';

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
          // タスク名
          const Text('タスク名'),
          AppTextField(
            hintText: selectedTaskType == 0 ? '例: 自転車に初めて乗る' : '例: 宿題をする',
            onChanged: (v) => setState(() => taskName = v),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 16),
          // 説明
          const Text('説明'),
          AppTextField(
            hintText:
                selectedTaskType == 0
                    ? '例: 補助輪なしで自転車に乗れるようになる'
                    : '例: 算数と国語の宿題を完了する',
            onChanged: (v) => setState(() => description = v),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 16),
          // カテゴリ
          const Text('カテゴリ'),
          CategoryChoiceChips(
            categories: ['勉強', '運動', '生活'],
            selectedIndex: selectedCategory,
            onSelected: (i) => setState(() => selectedCategory = i),
          ),
          const SizedBox(height: 16),
          // 報酬設定
          const Text('報酬設定'),
          Row(
            children: [
              const Text('獲得コイン数'),
              const SizedBox(width: 8),
              SizedBox(
                width: 80,
                child: AppTextField.amount(
                  hintText: selectedTaskType == 0 ? '例: 100' : '例: 50',
                  onChanged: (v) {},
                ),
              ),
              const SizedBox(width: 8),
              const Text('コイン'),
            ],
          ),
          CoinAmountSelector(
            amounts:
                selectedTaskType == 0 ? [50, 100, 200, 500] : [20, 30, 50, 100],
            selectedIndex: selectedCoin,
            onSelected: (i) => setState(() => selectedCoin = i),
          ),
          const SizedBox(height: 24),
          // チャレンジタスク設定 or スケジュール設定
          if (selectedTaskType == 0) ...[
            // チャレンジ
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.orange[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.emoji_events, color: Colors.orange),
                      SizedBox(width: 8),
                      Text(
                        'チャレンジタスク設定',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text('難易度レベル'),
                  Row(
                    children: List.generate(
                      difficulties.length,
                      (i) => Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ChoiceChip(
                          label: Text(difficulties[i]),
                          selected: difficulty == difficulties[i],
                          onSelected:
                              (_) =>
                                  setState(() => difficulty = difficulties[i]),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text('達成条件'),
                  AppTextField(
                    hintText: '例: 補助輪なしで10メートル以上乗れること',
                    onChanged: (v) {},
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
          ] else ...[
            // スケジュール設定
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.repeat, color: Colors.blue),
                      SizedBox(width: 8),
                      Text(
                        'スケジュール設定',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text('頻度'),
                  ScheduleFrequencySelector(
                    selectedIndex: scheduleFrequency,
                    onChanged: (i) async {
                      if (i == 2) {
                        // カスタム選択時にボトムシートを表示
                        await showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(24),
                            ),
                          ),
                          builder:
                              (context) => const CustomScheduleBottomSheet(),
                        );
                      }
                      setState(() => scheduleFrequency = i);
                    },
                  ),
                  if (scheduleFrequency == 1) ...[
                    // 毎週
                    const SizedBox(height: 16),
                    const Text('曜日を選択'),
                    WeekdaySelector(
                      selectedWeekdays: selectedWeekdays,
                      onChanged:
                          (i) => setState(
                            () => selectedWeekdays[i] = !selectedWeekdays[i],
                          ),
                    ),
                    const SizedBox(height: 16),
                    ScheduleSummaryBox(selectedWeekdays: selectedWeekdays),
                  ] else if (scheduleFrequency == 2) ...[
                    // カスタム
                    const SizedBox(height: 16),
                    // スケジュール概要
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.green[50],
                        border: Border.all(color: Colors.green.shade200),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Row(
                            children: [
                              Icon(Icons.calendar_today, color: Colors.green),
                              SizedBox(width: 8),
                              Text(
                                'スケジュール概要',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Text('2日ごと'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    // カレンダー
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.chevron_left),
                          onPressed: null,
                        ),
                        Text(
                          '2024年1月',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.chevron_right),
                          onPressed: null,
                        ),
                        Spacer(),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('日', style: TextStyle(color: Colors.red)),
                              Text('月'),
                              Text('火'),
                              Text('水'),
                              Text('木'),
                              Text('金'),
                              Text('土', style: TextStyle(color: Colors.blue)),
                            ],
                          ),
                          SizedBox(height: 8),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: [
                              for (int i = 1; i <= 31; i++)
                                _CustomCalendarDay(
                                  day: i,
                                  isStart: i == 15,
                                  isExec: [
                                    15,
                                    17,
                                    19,
                                    21,
                                    23,
                                    25,
                                    27,
                                    29,
                                    31,
                                  ].contains(i),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    // 凡例
                    Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        SizedBox(width: 4),
                        Text('開始日'),
                        SizedBox(width: 16),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Colors.blue[100],
                            border: Border.all(color: Colors.blue, width: 2),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        SizedBox(width: 4),
                        Text('実行日'),
                      ],
                    ),
                  ],
                ],
              ),
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
  }
}

class _CustomCalendarDay extends StatelessWidget {
  final int day;
  final bool isStart;
  final bool isExec;
  const _CustomCalendarDay({
    required this.day,
    required this.isStart,
    required this.isExec,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color:
            isStart
                ? Colors.black
                : isExec
                ? Colors.blue[100]
                : Colors.transparent,
        border: Border.all(
          color: isExec ? Colors.blue : Colors.transparent,
          width: isExec ? 2 : 0,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        '$day',
        style: TextStyle(
          color:
              isStart
                  ? Colors.white
                  : isExec
                  ? Colors.blue[900]
                  : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
