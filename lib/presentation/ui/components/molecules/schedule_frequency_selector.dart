import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ScheduleFrequencySelector extends StatelessWidget {
  const ScheduleFrequencySelector({
    required this.selectedIndex,
    required this.onChanged,
    super.key,
  });
  final int selectedIndex;
  final ValueChanged<int> onChanged;

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

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(IntProperty('selectedIndex', selectedIndex))
      ..add(ObjectFlagProperty<ValueChanged<int>>.has('onChanged', onChanged));
  }
}
