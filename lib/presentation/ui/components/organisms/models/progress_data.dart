import 'package:family_coin/presentation/ui/components/atoms/app_icon.dart';
import 'package:flutter/foundation.dart';

/// 進捗カードのデータモデル
@immutable
class ProgressData {
  /// コンストラクタ
  const ProgressData({
    required this.icon,
    required this.title,
    required this.valueText,
    this.progress,
  });

  /// アイコン
  final AppIcon icon;

  /// タイトル
  final String title;

  /// 値のテキスト表示
  final String valueText;

  /// 進捗率（0.0-1.0）
  final double? progress;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProgressData &&
          runtimeType == other.runtimeType &&
          icon == other.icon &&
          title == other.title &&
          valueText == other.valueText &&
          progress == other.progress;

  @override
  int get hashCode =>
      icon.hashCode ^ title.hashCode ^ valueText.hashCode ^ progress.hashCode;

  @override
  String toString() =>
      'ProgressData(icon: $icon, title: $title, valueText: $valueText, progress: $progress)';
}