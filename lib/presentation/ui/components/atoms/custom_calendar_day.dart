import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// カスタムカレンダー日付セル
class CustomCalendarDay extends StatelessWidget {

  /// constructor
  const CustomCalendarDay({
    required this.day, required this.isStart, required this.isExec, super.key,
  });
  /// 日付
  final int day;

  /// 開始日かどうか
  final bool isStart;

  /// 実行日かどうか
  final bool isExec;

  @override
  Widget build(BuildContext context) => Container(
    width: 36,
    height: 36,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: isStart
          ? Colors.black
          : isExec
          ? Colors.blue[100]
          : Colors.transparent,
      border: Border.all(
        color: isExec ? Colors.blue : Colors.transparent,
        width: isExec ? 2 : 0,
      ),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Text(
      '$day',
      style: TextStyle(
        color: isStart
            ? Colors.white
            : isExec
            ? Colors.blue[900]
            : Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(IntProperty('day', day))
      ..add(FlagProperty('isStart', value: isStart))
      ..add(FlagProperty('isExec', value: isExec));
  }
}