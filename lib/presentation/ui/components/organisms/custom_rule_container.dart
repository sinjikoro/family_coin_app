import 'package:family_coin/presentation/util/enums.dart';
import 'package:family_coin/presentation/util/extension/datetime_extension.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rrule/rrule.dart';

/// カスタムルールのコンテナ
class CustomRuleContainer extends StatefulWidget {
  /// コンストラクタ
  const CustomRuleContainer({
    required this.onRuleChanged,
    required this.selectedDate,
    this.initialRule,
    super.key,
  });

  /// カスタムルールの変更時のコールバック
  final void Function(RecurrenceRule?) onRuleChanged;

  /// 初期ルール
  final RecurrenceRule? initialRule;

  /// 選択された日付
  final DateTime selectedDate;

  @override
  State<CustomRuleContainer> createState() => __CustomRuleContainerState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        ObjectFlagProperty<void Function(RecurrenceRule? p1)>.has(
          'onRuleChanged',
          onRuleChanged,
        ),
      )
      ..add(DiagnosticsProperty<RecurrenceRule?>('initialRule', initialRule))
      ..add(DiagnosticsProperty<DateTime>('selectedDate', selectedDate));
  }
}

class __CustomRuleContainerState extends State<CustomRuleContainer> {
  /// 選択せれている繰り返しルール
  RecurrenceRule _selectedRule = RecurrenceRule(
    frequency: Frequency.daily,
    interval: 1,
  );

  // 繰り返しの基礎パラメータ

  /// 選択されているinterval
  int? get _selectedInterval => _selectedRule.interval;
  set _selectedInterval(int? interval) =>
      _selectedRule = _selectedRule.copyWith(interval: interval);

  /// 選択せれているfrequency
  Frequency get _selectedFrequency => _selectedRule.frequency;
  set _selectedFrequency(Frequency frequency) =>
      _selectedRule = _selectedRule.copyWith(frequency: frequency);

  // 繰り返しの週次用パラメータ

  /// 毎週X,Y,Z曜日の 曜日X,Y,Z
  List<ByWeekDayEntry> get _selectedWeekByWeekDays =>
      _selectedFrequency == Frequency.weekly
          ? _selectedRule.byWeekDays
          : <ByWeekDayEntry>[];

  // 繰り返しの月次用パラメータ

  /// 月次ルールのタイプ（毎月X日 or 毎月第X Y曜日）
  RecurrencePatternType get _selectedMonthlyRuleType {
    final isByMonthDays = _selectedRule.hasByMonthDays;
    final byWeekDayEntry =
        _selectedRule.hasByWeekDays
            ? _selectedRule.byWeekDays.first
            : ByWeekDayEntry(1);
    final isByLastWeekDay = (byWeekDayEntry.occurrence ?? 0) == -1;

    return switch ((isByMonthDays, isByLastWeekDay)) {
      (true, _) => RecurrencePatternType.dayOfMonth,
      (false, true) => RecurrencePatternType.lastWeekOfMonth,
      (false, _) => RecurrencePatternType.weekDayOfMonth,
    };
  }

  /// 毎月X日 の日付項目
  int get _selectedMonthByMonthDay => widget.selectedDate.day;

  /// 毎月第X Y曜日の定義
  /// ByWeekDayEntry(曜日の値、週の番号)
  ByWeekDayEntry get _selectedMonthByWeekDay => ByWeekDayEntry(
    widget.selectedDate.weekday,
    widget.selectedDate.weekOfMonth,
  );

  /// 最終週のX曜日の定義
  ByWeekDayEntry get _selectedMonthByWeekDayLastWeek =>
      ByWeekDayEntry(widget.selectedDate.weekday, -1);

  // 繰り返しの年次パラメータ

  @override
  void initState() {
    super.initState();
    // 初期値を設定
    if (widget.initialRule != null) {
      _selectedRule = widget.initialRule!;
    }
  }

  @override
  void didUpdateWidget(CustomRuleContainer oldWidget) {
    super.didUpdateWidget(oldWidget);

    // selectedDateが変更された場合、ルールを更新
    if (oldWidget.selectedDate != widget.selectedDate) {
      // ルールを自動更新
      _updateRuleForNewDate(widget.selectedDate);
    }
  }

  /// 呼び出し元の方でselectedDateを変更された際のハンドラ
  void _updateRuleForNewDate(DateTime newDateTime) {
    switch (_selectedFrequency) {
      case Frequency.monthly:
        if (_selectedMonthlyRuleType == RecurrencePatternType.lastWeekOfMonth) {
          _selectedRule = _selectedRule.copyWith(
            byWeekDays: [_selectedMonthByWeekDay],
          );
        }
      case Frequency.daily:
      case Frequency.hourly:
      case Frequency.minutely:
      case Frequency.secondly:
      case Frequency.weekly:
      case Frequency.yearly:
    }
  }

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Row(
        children: [
          // Interval選択ドロップダウン
          Expanded(
            child: _CustomInvervalSelectDropDown(
              value: _selectedInterval,
              onChanged: (interval) {
                if (interval == null) return;
                setState(() {
                  _selectedInterval = interval;
                });
                widget.onRuleChanged(_selectedRule);
              },
            ),
          ),
          const SizedBox(width: 16),
          // Frequency選択ドロップダウン
          Expanded(
            child: _CustomFrequencySelectDropDown(
              value: _selectedFrequency,
              onChanged: (frequency) {
                if (frequency == null) return;
                setState(() {
                  _selectedFrequency = frequency;
                });
                widget.onRuleChanged(_selectedRule);
              },
            ),
          ),
        ],
      ),
      switch (_selectedFrequency) {
        // 週次ルール
        Frequency.weekly => Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            // 週の曜日選択
            for (final weekDay in WeekDay.values)
              FilterChip(
                label: Text(weekDay.name),
                selected: _selectedWeekByWeekDays.contains(
                  ByWeekDayEntry(weekDay.value),
                ),
                showCheckmark: false,
                onSelected: (isSelected) {
                  final currentByWeekDays = List<ByWeekDayEntry>.from(
                    _selectedRule.byWeekDays,
                  );
                  if (isSelected) {
                    currentByWeekDays.add(ByWeekDayEntry(weekDay.value));
                  } else {
                    currentByWeekDays.removeWhere(
                      (e) => e.day == weekDay.value,
                    );
                  }
                  setState(() {
                    _selectedRule = RecurrenceRule(
                      frequency: Frequency.weekly,
                      interval: _selectedInterval,
                      byWeekDays: currentByWeekDays,
                    );
                  });
                  widget.onRuleChanged(_selectedRule);
                },
              ),
          ],
        ),
        // 月次ルール
        Frequency.monthly => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                FilterChip(
                  // TODO(naga): 曜日の表示を修正
                  label: Text('毎月$_selectedMonthByMonthDay日'),
                  selected:
                      _selectedMonthlyRuleType ==
                      RecurrencePatternType.dayOfMonth,
                  showCheckmark: false,
                  onSelected: (_) {
                    setState(() {
                      _selectedRule = RecurrenceRule(
                        frequency: Frequency.monthly,
                        interval: _selectedInterval,
                        byMonthDays: [_selectedMonthByMonthDay],
                      );
                    });
                    widget.onRuleChanged(_selectedRule);
                  },
                ),
                if (widget.selectedDate.isLastWeek)
                  FilterChip(
                    label: Text(
                      '最終週の${WeekDay.fromValue(_selectedMonthByWeekDay.day).name}',
                    ),
                    selected:
                        _selectedMonthlyRuleType ==
                        RecurrencePatternType.lastWeekOfMonth,
                    showCheckmark: false,
                    onSelected: (_) {
                      setState(() {
                        _selectedRule = RecurrenceRule(
                          frequency: Frequency.monthly,
                          interval: _selectedInterval,
                          byWeekDays: [_selectedMonthByWeekDayLastWeek],
                        );
                      });
                      widget.onRuleChanged(_selectedRule);
                    },
                  ),
                FilterChip(
                  // TODO(naga): 曜日の表示を修正
                  label: Text(
                    '第${_selectedMonthByWeekDay.occurrence ?? 0 + 1} ${WeekDay.fromValue(_selectedMonthByWeekDay.day).name}',
                  ),
                  selected:
                      _selectedMonthlyRuleType ==
                      RecurrencePatternType.weekDayOfMonth,
                  showCheckmark: false,
                  onSelected: (_) {
                    setState(() {
                      _selectedRule = RecurrenceRule(
                        frequency: Frequency.monthly,
                        interval: _selectedInterval,
                        byWeekDays: [_selectedMonthByWeekDay],
                      );
                    });
                    widget.onRuleChanged(_selectedRule);
                  },
                ),
              ],
            ),
          ],
        ),
        _ => const SizedBox.shrink(),
      },
    ],
  );
}

/// カスタムルールのInterval選択ドロップダウン
class _CustomInvervalSelectDropDown extends StatelessWidget {
  const _CustomInvervalSelectDropDown({
    required this.value,
    required this.onChanged,
  });

  final int? value;
  final Function(int?) onChanged;

  @override
  Widget build(BuildContext context) => DropdownButtonFormField<int>(
    items: List.generate(
      10,
      (index) =>
          DropdownMenuItem<int>(value: index + 1, child: Text('${index + 1}')),
    ),
    value: value,
    onChanged: onChanged,
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(ObjectFlagProperty<Function(int? p1)>.has('onChanged', onChanged))
      ..add(IntProperty('value', value));
  }
}

/// 繰り返しカスタム時のFreqency選択ドロップダウン
class _CustomFrequencySelectDropDown extends StatelessWidget {
  _CustomFrequencySelectDropDown({
    required this.value,
    required this.onChanged,
  });

  final Frequency? value;
  final Function(Frequency?) onChanged;

  final _frequencyList = <Frequency>[
    Frequency.daily,
    Frequency.weekly,
    Frequency.monthly,
    Frequency.yearly,
  ];

  @override
  Widget build(BuildContext context) => DropdownButtonFormField<Frequency>(
    items:
        _frequencyList
            .map(
              (frequency) => DropdownMenuItem<Frequency>(
                value: frequency,
                child: Text(frequency.toString().split('.').last),
              ),
            )
            .toList(),
    value: value,
    onChanged: onChanged,
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        ObjectFlagProperty<Function(Frequency? p1)>.has('onChanged', onChanged),
      )
      ..add(DiagnosticsProperty<Frequency?>('value', value));
  }
}

/// 繰り返しのルールパターン
enum RecurrencePatternType {
  /// 毎月X日
  dayOfMonth,

  /// 毎月第X Y曜日
  weekDayOfMonth,

  /// 最終週の X曜日
  lastWeekOfMonth,
}
