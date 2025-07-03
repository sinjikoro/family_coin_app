import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// カレンダーヘッダー
class CalendarHeader extends StatelessWidget {
  /// 年月表示テキスト
  final String yearMonth;

  /// 前月ボタンコールバック
  final VoidCallback? onPrevMonth;

  /// 次月ボタンコールバック
  final VoidCallback? onNextMonth;

  /// constructor
  const CalendarHeader({
    super.key,
    required this.yearMonth,
    this.onPrevMonth,
    this.onNextMonth,
  });

  @override
  Widget build(BuildContext context) => Row(
    children: [
      IconButton(
        icon: const Icon(Icons.chevron_left),
        onPressed: onPrevMonth,
      ),
      Text(
        yearMonth,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      IconButton(
        icon: const Icon(Icons.chevron_right),
        onPressed: onNextMonth,
      ),
      const Spacer(),
    ],
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('yearMonth', yearMonth));
  }
}