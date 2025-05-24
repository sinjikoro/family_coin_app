import 'package:family_coin/presentation/routing/route_path.dart';
import 'package:flutter/material.dart';

// TODO(nage): labelをl10nにする
/// ボトムナビゲーションの項目
enum BottomNavigationItem {
  /// ホーム
  home(icon: Icons.home_rounded, label: 'ホーム', path: RoutePath.home),

  /// タスク一覧
  tasks(icon: Icons.task_rounded, label: 'タスク', path: RoutePath.taskList),

  /// ほしいもの一覧
  wishlist(
    icon: Icons.card_giftcard_rounded,
    label: 'ほしいもの',
    path: RoutePath.wishItemList,
  );

  /// コンストラクタ
  const BottomNavigationItem({
    required this.icon,
    required this.label,
    required this.path,
  });

  /// アイコン
  final IconData icon;

  /// ラベル
  final String label;

  /// パス
  final String path;
}
