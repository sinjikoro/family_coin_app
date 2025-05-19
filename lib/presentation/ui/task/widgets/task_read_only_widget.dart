import 'package:family_coin/domain/value_object/approval_status.dart';
import 'package:family_coin/domain/value_object/difficuly.dart';
import 'package:family_coin/domain/value_object/family_coin.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// タスクの読み取り専用ウィジェット
class TaskReadOnlyWidget extends StatelessWidget {
  /// constructor
  const TaskReadOnlyWidget({
    required this.taskName,
    required this.taskDescription,
    required this.taskEarnCoins,
    required this.taskDifficulty,
    required this.taskRegistrationStatus,
    super.key,
  });

  /// タスク名
  final String taskName;

  /// タスクの説明
  final String taskDescription;

  /// 獲得コイン
  final FamilyCoin taskEarnCoins;

  /// 難易度
  final Difficulty taskDifficulty;

  /// 登録状況
  final ApprovalStatus taskRegistrationStatus;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('タスク: $taskName', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Text('説明: $taskDescription'),
        const SizedBox(height: 10),
        Text('報酬: $taskEarnCoinsコイン'),
        const SizedBox(height: 10),
        Text('難易度: $taskDifficulty'),
        const SizedBox(height: 10),
        Text('登録状況: $taskRegistrationStatus'),
      ],
    ),
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('taskName', taskName))
      ..add(DiagnosticsProperty<FamilyCoin>('taskEarnCoins', taskEarnCoins))
      ..add(StringProperty('taskDescription', taskDescription))
      ..add(DiagnosticsProperty<Difficulty>('taskDifficulty', taskDifficulty))
      ..add(DiagnosticsProperty<ApprovalStatus>('taskRegistrationStatus', taskRegistrationStatus));
  }
}
