import 'package:family_coin/presentation/ui/components/atoms/app_text.dart';
import 'package:family_coin/presentation/ui/components/molecules/task_list_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// タスクリストセクション
class TaskListSection extends StatelessWidget {
  /// コンストラクタ
  const TaskListSection({required this.title, required this.items, super.key});

  /// セクションタイトル
  final String title;

  /// タスクリスト
  final List<TaskListItem> items;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            const Icon(Icons.calendar_today, size: 20),
            const SizedBox(width: 8),
            AppText(text: title, fontWeight: FontWeight.bold, fontSize: 18),
            const Spacer(),
            AppText(text: '${items.length}個', fontSize: 14, color: Colors.grey),
          ],
        ),
      ),
      Expanded(
        child: SingleChildScrollView(
          child: Column(
            children:
                items
                    .map(
                      (item) => Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        child: item,
                      ),
                    )
                    .toList(),
          ),
        ),
      ),
    ],
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('title', title));
  }
}
