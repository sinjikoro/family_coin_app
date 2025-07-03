import 'package:flutter/material.dart';

class ScheduleFrequencySelector extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onChanged;
  const ScheduleFrequencySelector({
    super.key,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final labels = ['毎日', '毎週', 'カスタム'];
    return Row(
      children: List.generate(
        3,
        (i) => Padding(
          padding: const EdgeInsets.only(right: 8),
          child: ChoiceChip(
            label: Text(labels[i]),
            selected: selectedIndex == i,
            onSelected: (_) => onChanged(i),
          ),
        ),
      ),
    );
  }
}
