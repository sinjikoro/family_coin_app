import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:family_coin/presentation/ui/components/atoms/app_text_field.dart';

/// タスクフォームセクション
class TaskFormSection extends StatelessWidget {
  /// タスク種別（0:チャレンジ、1:ルーティン）
  final int taskType;

  /// タスク名
  final String taskName;

  /// 説明
  final String description;

  /// タスク名変更コールバック
  final ValueChanged<String> onTaskNameChanged;

  /// 説明変更コールバック
  final ValueChanged<String> onDescriptionChanged;

  /// constructor
  const TaskFormSection({
    super.key,
    required this.taskType,
    required this.taskName,
    required this.description,
    required this.onTaskNameChanged,
    required this.onDescriptionChanged,
  });

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // タスク名
      const Text('タスク名'),
      AppTextField(
        hintText: taskType == 0 ? '例: 自転車に初めて乗る' : '例: 宿題をする',
        onChanged: onTaskNameChanged,
        textAlign: TextAlign.left,
      ),
      const SizedBox(height: 16),
      // 説明
      const Text('説明'),
      AppTextField(
        hintText: taskType == 0 
          ? '例: 補助輪なしで自転車に乗れるようになる'
          : '例: 算数と国語の宿題を完了する',
        onChanged: onDescriptionChanged,
        textAlign: TextAlign.left,
      ),
    ],
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(IntProperty('taskType', taskType))
      ..add(StringProperty('taskName', taskName))
      ..add(StringProperty('description', description));
  }
}