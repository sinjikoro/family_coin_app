import 'package:family_coin/presentation/l10n/rrule_l10n_ja.dart';
import 'package:family_coin/presentation/ui/task/widgets/custom_rule_container.dart';
import 'package:family_coin/presentation/util/enums.dart';
import 'package:family_coin/presentation/util/extension/context_extension.dart';
import 'package:family_coin/presentation/util/extension/datetime_extension.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rrule/rrule.dart';
import 'package:table_calendar/table_calendar.dart';

/// スケジュール選択ウィジェット
class SchedulePicker extends StatefulWidget {
  /// constructor
  const SchedulePicker({
    required this.onDateSelected,
    this.initialDate,
    this.initialRule,
    super.key,
  });

  /// 初期選択日
  final DateTime? initialDate;

  /// 初期選択の繰り返しルール
  final RecurrenceRule? initialRule;

  /// 日付選択時のコールバック
  final void Function(DateTime?)? onDateSelected;

  @override
  State<SchedulePicker> createState() => _SchedulePickerState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<DateTime?>('initialDate', initialDate))
      ..add(DiagnosticsProperty<RecurrenceRule?>('initialRule', initialRule))
      ..add(
        ObjectFlagProperty<void Function(DateTime? p1)?>.has(
          'onDateSelected',
          onDateSelected,
        ),
      );
  }
}

class _SchedulePickerState extends State<SchedulePicker> {
  /// 選択中の日付
  DateTime _selectedDate = DateTime.now();

  /// 選択中の繰り返し
  RecurrenceRule? _selectedRule;

  /// 繰り返しルールのテキストローカライズ
  RruleL10n? rruleL10n;

  /// ローカライズの初期化済みフラグ
  bool _isL10nInitialized = false;

  /// カスタム選択中フラグ
  bool _isCustomRuleSelected = false;

  @override
  void initState() {
    super.initState();
    if (widget.initialDate != null) {
      _selectedDate = widget.initialDate!;
    }
    if (widget.initialRule != null) {
      _selectedRule = widget.initialRule;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isL10nInitialized) {
      // 初回に一度だけ、ローカライズの初期化を行う
      // この処理はcontextを利用し、またbuild内で行うと画面のちらつきが
      // 発生してしまう為、didChangeDependencies()にて実施している
      // ignore: discarded_futures
      _initializeL10n();
    }
  }

  /// ローカライズの初期化
  Future<void> _initializeL10n() async {
    final locale = context.l10n.localeName;
    final l10n =
        locale.startsWith('ja')
            ? await RruleL10nJa.create()
            : await RruleL10nEn.create();
    if (mounted) {
      setState(() {
        rruleL10n = l10n;
        _isL10nInitialized = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (rruleL10n == null) {
      return const Center(child: CircularProgressIndicator());
    }

    final l10n = rruleL10n!;
    return Container(
      padding: const EdgeInsets.all(16),
      height: context.screenHeight * 0.7,
      child: Column(
        children: [
          // カレンダー（固定）
          _Calendar(
            selectedDate: _selectedDate,
            selectedRule: _selectedRule,
            onDateSelected: (date) {
              if (date != null) {
                setState(() {
                  _selectedDate = date;
                });
              }
            },
          ),
          const SizedBox(height: 16),
          // 中間のスクロール可能な部分
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 32,
                children: [
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      // 繰り返しなし
                      FilterChip(
                        label: Text(context.l10n.taskScheduleNotRecurrence),
                        selected:
                            !_isCustomRuleSelected && _selectedRule == null,
                        showCheckmark: false,
                        onSelected: (selected) {
                          setState(() {
                            _selectedRule = null;
                            _isCustomRuleSelected = false;
                          });
                        },
                      ),
                      // 毎日
                      FilterChip(
                        label: Text(_rruleEveryDay().toText(l10n: l10n)),
                        selected:
                            !_isCustomRuleSelected &&
                            _selectedRule == _rruleEveryDay(),
                        showCheckmark: false,
                        onSelected: (selected) {
                          setState(() {
                            _selectedRule = _rruleEveryDay();
                            _isCustomRuleSelected = false;
                          });
                        },
                      ),
                      // 週次
                      FilterChip(
                        label: Text(
                          _rruleEveryWeek(_selectedDate).toText(l10n: l10n),
                        ),
                        selected:
                            !_isCustomRuleSelected &&
                            _selectedRule == _rruleEveryWeek(_selectedDate),
                        showCheckmark: false,
                        onSelected: (selected) {
                          setState(() {
                            _selectedRule = _rruleEveryWeek(_selectedDate);
                            _isCustomRuleSelected = false;
                          });
                        },
                      ),
                      // 平日
                      FilterChip(
                        label: Text(_rruleEveryWeekdays().toText(l10n: l10n)),
                        selected:
                            !_isCustomRuleSelected &&
                            _selectedRule == _rruleEveryWeekdays(),
                        showCheckmark: false,
                        onSelected: (selected) {
                          setState(() {
                            _selectedRule = _rruleEveryWeekdays();
                            _isCustomRuleSelected = false;
                          });
                        },
                      ),
                      // 月次
                      FilterChip(
                        label: Text(
                          _rruleEveryMonth(_selectedDate).toText(l10n: l10n),
                        ),
                        selected:
                            !_isCustomRuleSelected &&
                            _selectedRule == _rruleEveryMonth(_selectedDate),
                        showCheckmark: false,
                        onSelected: (selected) {
                          setState(() {
                            _selectedRule = _rruleEveryMonth(_selectedDate);
                            _isCustomRuleSelected = false;
                          });
                        },
                      ),
                      // カスタム
                      FilterChip(
                        label: Text(context.l10n.taskScheduleCustom),
                        selected: _isCustomRuleSelected,
                        showCheckmark: false,
                        onSelected: (selected) {
                          setState(() {
                            _isCustomRuleSelected = true;
                            _selectedRule = null;
                          });
                        },
                      ),
                    ],
                  ),
                  if (_isCustomRuleSelected)
                    CustomRuleContainer(
                      onRuleChanged: (rule) {
                        setState(() {
                          _isCustomRuleSelected = true;
                          _selectedRule = rule;
                        });
                      },
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          // 確定ボタン（固定）
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _SubmitButton(
                onPressed: () {
                  widget.onDateSelected?.call(_selectedDate);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// RecurrenceRule : 毎日
  RecurrenceRule _rruleEveryDay() => RecurrenceRule(frequency: Frequency.daily);

  /// RecurrenceRule : 毎週
  RecurrenceRule _rruleEveryWeek(DateTime date) => RecurrenceRule(
    frequency: Frequency.weekly,
    byWeekDays: [ByWeekDayEntry(date.weekday)],
  );

  /// RecurrenceRule : 毎週平日
  RecurrenceRule _rruleEveryWeekdays() => RecurrenceRule(
    frequency: Frequency.weekly,
    byWeekDays: [
      ByWeekDayEntry(WeekDay.monday.value),
      ByWeekDayEntry(WeekDay.tuesday.value),
      ByWeekDayEntry(WeekDay.wednesday.value),
      ByWeekDayEntry(WeekDay.thursday.value),
      ByWeekDayEntry(WeekDay.friday.value),
    ],
  );

  /// RecurrenceRule : 毎月
  RecurrenceRule _rruleEveryMonth(DateTime date) =>
      RecurrenceRule(frequency: Frequency.monthly, byMonthDays: [date.day]);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<DateTime?>('initialDate', widget.initialDate))
      ..add(
        ObjectFlagProperty<void Function(DateTime? p1)?>.has(
          'onDateSelected',
          widget.onDateSelected,
        ),
      )
      ..add(DiagnosticsProperty<RruleL10n?>('rruleL10n', rruleL10n));
  }
}

/// カレンダー
class _Calendar extends StatelessWidget {
  /// constructor
  const _Calendar({
    required this.selectedDate,
    required this.selectedRule,
    required this.onDateSelected,
  });

  /// 選択中の日付
  final DateTime? selectedDate;

  /// 選択中の繰り返しルール
  final RecurrenceRule? selectedRule;

  /// 日付選択時のコールバック
  final void Function(DateTime?)? onDateSelected;

  @override
  Widget build(BuildContext context) => TableCalendar(
    firstDay: DateTime.now(),
    lastDay: DateTime.now().add(const Duration(days: 365)),
    focusedDay: selectedDate ?? DateTime.now(),
    selectedDayPredicate: (day) {
      if (selectedRule == null) {
        if (selectedDate == null) return false;
        return day.isSameDay(selectedDate!);
      } else {
        // 繰り返しルールがある場合、選択日がルールに含まれるかチェック
        final occurrences = selectedRule!.getInstances(
          start: selectedDate?.toUtc() ?? DateTime.now().toUtc(),
          before: DateTime.now().add(const Duration(days: 365)).toUtc(),
        );
        final dayUtc = day.toUtc();
        return occurrences.any((occurrence) => occurrence.isSameDay(dayUtc));
      }
    },
    onDaySelected: (selectedDay, focusedDay) {
      onDateSelected?.call(selectedDay);
    },
    onFormatChanged: (format) {},
    calendarStyle: const CalendarStyle(
      todayDecoration: BoxDecoration(
        color: Colors.lightBlueAccent,
        shape: BoxShape.circle,
      ),
      selectedDecoration: BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.circle,
      ),
    ),
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<DateTime?>('selectedDate', selectedDate))
      ..add(
        ObjectFlagProperty<void Function(DateTime? p1)?>.has(
          'onDateSelected',
          onDateSelected,
        ),
      )
      ..add(DiagnosticsProperty<RecurrenceRule?>('selectedRule', selectedRule));
  }
}

/// 確定ボタン
class _SubmitButton extends StatelessWidget {
  const _SubmitButton({required this.onPressed});

  /// ボタンのコールバック
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) =>
      ElevatedButton(onPressed: onPressed, child: const Icon(Icons.check));

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      ObjectFlagProperty<VoidCallback?>.has('onPressed', onPressed),
    );
  }
}
