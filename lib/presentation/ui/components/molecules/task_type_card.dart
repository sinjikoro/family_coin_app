import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// タスク種別カード
class TaskTypeCard extends StatelessWidget {
  /// コンストラクタ
  const TaskTypeCard({
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.description,
    this.selected = false,
    this.onTap,
    super.key,
  });

  /// アイコン
  final IconData icon;

  /// タイトル
  final String title;

  /// サブタイトル
  final String subTitle;

  /// 説明
  final String description;

  /// 選択されているかどうか
  final bool selected;

  /// タップされた時のコールバック
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        color: selected ? Colors.yellow[50] : Colors.grey[100],
        border: Border.all(
          color: selected ? Colors.orange : Colors.transparent,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.orange, size: 32),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    subTitle,
                    style: const TextStyle(color: Colors.orange, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
          ),
        ],
      ),
    ),
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<IconData>('icon', icon))
      ..add(StringProperty('title', title))
      ..add(StringProperty('subTitle', subTitle))
      ..add(StringProperty('description', description))
      ..add(DiagnosticsProperty<bool>('selected', selected))
      ..add(ObjectFlagProperty<VoidCallback?>.has('onTap', onTap));
  }
}
