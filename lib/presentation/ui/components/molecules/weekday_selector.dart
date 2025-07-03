import 'package:flutter/material.dart';

class WeekdaySelector extends StatelessWidget {
  final List<bool> selectedWeekdays;
  final ValueChanged<int> onChanged;
  const WeekdaySelector({
    super.key,
    required this.selectedWeekdays,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
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
                color:
                    isSelected ? const Color(0xFF1A1D29) : Colors.transparent,
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
  }
}
