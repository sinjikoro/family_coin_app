import 'package:flutter/material.dart';

class ScheduleSummaryBox extends StatelessWidget {
  final List<bool> selectedWeekdays;
  const ScheduleSummaryBox({super.key, required this.selectedWeekdays});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.green[50],
        border: Border.all(color: Colors.green.shade200),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.calendar_today, color: Colors.green),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'スケジュール概要',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '毎週 ' +
                      List.generate(
                        7,
                        (i) =>
                            selectedWeekdays[i]
                                ? ['月', '火', '水', '木', '金', '土', '日'][i]
                                : null,
                      ).where((e) => e != null).join('・') +
                      '曜日',
                  style: const TextStyle(color: Colors.black87),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
