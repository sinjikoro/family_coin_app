import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// 履歴リストアイテム
class HistoryListItem extends StatelessWidget {
  /// constructor
  const HistoryListItem({
    required this.title,
    required this.subtitle,
    super.key,
    this.icon = Icons.check_circle,
    this.backgroundColor,
  });

  /// タイトル
  final String title;

  /// サブタイトル
  final String subtitle;

  /// アイコン
  final IconData icon;

  /// 背景色
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.only(bottom: 8),
    decoration: BoxDecoration(
      color: backgroundColor ?? Colors.green[50],
      borderRadius: BorderRadius.circular(12),
    ),
    child: ListTile(
      leading: Icon(icon, color: Colors.green),
      title: Text(title),
      subtitle: Text(subtitle),
    ),
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('title', title))
      ..add(StringProperty('subtitle', subtitle))
      ..add(DiagnosticsProperty<IconData>('icon', icon))
      ..add(ColorProperty('backgroundColor', backgroundColor));
  }
}
