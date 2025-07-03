import 'package:flutter/material.dart';

/// カレンダー凡例
class CalendarLegend extends StatelessWidget {
  /// constructor
  const CalendarLegend({super.key});

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      const SizedBox(width: 4),
      const Text('開始日'),
      const SizedBox(width: 16),
      Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: Colors.blue[100],
          border: Border.all(color: Colors.blue, width: 2),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      const SizedBox(width: 4),
      const Text('実行日'),
    ],
  );
}