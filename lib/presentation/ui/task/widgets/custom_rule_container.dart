import 'package:family_coin/presentation/util/enums.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rrule/rrule.dart';

/// カスタムルールのコンテナ
class CustomRuleContainer extends StatefulWidget {
  /// コンストラクタ
  const CustomRuleContainer({required this.onRuleChanged, super.key});

  /// カスタムルールの変更時のコールバック
  final void Function(RecurrenceRule?) onRuleChanged;

  @override
  State<CustomRuleContainer> createState() => __CustomRuleContainerState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      ObjectFlagProperty<void Function(RecurrenceRule? p1)>.has(
        'onRuleChanged',
        onRuleChanged,
      ),
    );
  }
}

class __CustomRuleContainerState extends State<CustomRuleContainer> {
  /// 選択中のインターバル
  int _selectedInterval = 1;

  /// 選択中の週の曜日
  final List<ByWeekDayEntry> _selectedWeekDays = [];

  /// 選択中の頻度
  Frequency _selectedFrequency = Frequency.weekly;

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Row(
        children: [
          // Interval選択ドロップダウン
          Expanded(
            child: _CustomInvervalSelectDropDown(
              onChanged: (interval) {
                if (interval == null) return;
                setState(() {
                  _selectedInterval = interval;
                });
                widget.onRuleChanged(
                  RecurrenceRule(
                    frequency: _selectedFrequency,
                    interval: interval,
                  ),
                );
              },
            ),
          ),
          const SizedBox(width: 16),
          // Frequency選択ドロップダウン
          Expanded(
            child: _CustomFrequencySelectDropDown(
              onChanged: (frequency) {
                if (frequency == null) return;
                setState(() {
                  _selectedFrequency = frequency;
                });
                widget.onRuleChanged(
                  RecurrenceRule(
                    frequency: frequency,
                    interval: _selectedInterval,
                  ),
                );
              },
            ),
          ),
        ],
      ),
      if (_selectedFrequency == Frequency.weekly)
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final weekDay in WeekDay.values)
              FilterChip(
                label: Text(weekDay.name),
                selected: _selectedWeekDays.contains(
                  ByWeekDayEntry(weekDay.value),
                ),
                showCheckmark: false,
                onSelected: (isSelected) {
                  if (isSelected) {
                    _selectedWeekDays.add(ByWeekDayEntry(weekDay.value));
                  } else {
                    _selectedWeekDays.remove(ByWeekDayEntry(weekDay.value));
                  }
                  widget.onRuleChanged(
                    RecurrenceRule(
                      frequency: _selectedFrequency,
                      interval: _selectedInterval,
                      byWeekDays: _selectedWeekDays,
                    ),
                  );
                },
              ),
          ],
        ),
    ],
  );
}

/// カスタムルールのInterval選択ドロップダウン
class _CustomInvervalSelectDropDown extends StatelessWidget {
  const _CustomInvervalSelectDropDown({required this.onChanged});

  final Function(int?) onChanged;

  @override
  Widget build(BuildContext context) => DropdownButtonFormField<int>(
    items: List.generate(
      10,
      (index) =>
          DropdownMenuItem<int>(value: index + 1, child: Text('${index + 1}')),
    ),
    onChanged: onChanged,
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      ObjectFlagProperty<Function(int? p1)>.has('onChanged', onChanged),
    );
  }
}

/// 繰り返しカスタム時のFreqency選択ドロップダウン
class _CustomFrequencySelectDropDown extends StatelessWidget {
  _CustomFrequencySelectDropDown({required this.onChanged});

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
    onChanged: onChanged,
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      ObjectFlagProperty<Function(Frequency? p1)>.has('onChanged', onChanged),
    );
  }
}
