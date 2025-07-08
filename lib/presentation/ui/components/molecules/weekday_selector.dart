import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WeekdaySelector extends StatelessWidget {
  const WeekdaySelector({
    required this.selectedWeekdays,
    required this.onChanged,
    super.key,
  });
  final List<bool> selectedWeekdays;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) => Row(
    children: List.generate(7, (i) {
      final isSelected = selectedWeekdays[i];
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: GestureDetector(
          onTap: () => onChanged(i),
          child: Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFF1A1D29) : Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? Colors.transparent : Colors.black12,
                width: 2,
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              ['月', '火', '水', '木', '金', '土', '日'][i],
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black54,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      );
    }),
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(IterableProperty<bool>('selectedWeekdays', selectedWeekdays))
      ..add(ObjectFlagProperty<ValueChanged<int>>.has('onChanged', onChanged));
  }
}
