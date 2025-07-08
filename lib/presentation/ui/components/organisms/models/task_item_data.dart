import 'package:family_coin/presentation/ui/components/atoms/app_icon.dart';
import 'package:flutter/material.dart';

/// タスクアイテムのデータモデル
@immutable
class TaskItemData {
  /// コンストラクタ
  const TaskItemData({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.coin,
    required this.icon,
    required this.labelColor,
    this.isDone = false,
    this.isDisabled = false,
  });

  /// タスクID
  final String id;

  /// タイトル
  final String title;

  /// サブタイトル
  final String subTitle;

  /// 獲得コイン数
  final int coin;

  /// アイコン
  final AppIcon icon;

  /// ラベル色
  final Color labelColor;

  /// 完了状態
  final bool isDone;

  /// 無効状態
  final bool isDisabled;

  /// コピーメソッド
  TaskItemData copyWith({
    String? id,
    String? title,
    String? subTitle,
    int? coin,
    AppIcon? icon,
    Color? labelColor,
    bool? isDone,
    bool? isDisabled,
  }) =>
      TaskItemData(
        id: id ?? this.id,
        title: title ?? this.title,
        subTitle: subTitle ?? this.subTitle,
        coin: coin ?? this.coin,
        icon: icon ?? this.icon,
        labelColor: labelColor ?? this.labelColor,
        isDone: isDone ?? this.isDone,
        isDisabled: isDisabled ?? this.isDisabled,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskItemData &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          subTitle == other.subTitle &&
          coin == other.coin &&
          icon == other.icon &&
          labelColor == other.labelColor &&
          isDone == other.isDone &&
          isDisabled == other.isDisabled;

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      subTitle.hashCode ^
      coin.hashCode ^
      icon.hashCode ^
      labelColor.hashCode ^
      isDone.hashCode ^
      isDisabled.hashCode;

  @override
  String toString() =>
      'TaskItemData(id: $id, title: $title, isDone: $isDone, coin: $coin)';
}