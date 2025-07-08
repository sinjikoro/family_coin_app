import 'package:family_coin/presentation/ui/components/atoms/app_icon.dart';
import 'package:family_coin/presentation/ui/components/atoms/app_text.dart';
import 'package:family_coin/presentation/ui/components/atoms/color_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// タスクリストアイテム
class TaskListItem extends StatelessWidget {
  /// コンストラクタ
  const TaskListItem({
    required this.labelColor,
    required this.title,
    required this.subTitle,
    required this.coin,
    required this.icon,
    required this.isDone,
    required this.isDisabled,
    super.key,
    this.onTap,
  });

  /// ラベル色
  final Color labelColor;

  /// タイトル
  final String title;

  /// サブタイトル
  final String subTitle;

  /// コイン数
  final int coin;

  /// アイコン
  final AppIcon icon;

  /// 完了状態
  final bool isDone;

  /// グレーアウト
  final bool isDisabled;

  /// タップ時コールバック
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor =
        isDisabled ? theme.disabledColor : theme.textTheme.bodyMedium?.color;
    return Opacity(
      opacity: isDisabled ? 0.5 : 1.0,
      child: InkWell(
        onTap: isDisabled ? null : onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: theme.shadowColor.withValues(alpha: 0.03),
                blurRadius: 4,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ColorBar(color: labelColor),
              const SizedBox(width: 12),
              icon,
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: title,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: textColor,
                    ),
                    const SizedBox(height: 2),
                    AppText(text: subTitle, fontSize: 13, color: textColor),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const AppIcon(
                          type: AppIconType.coin,
                          size: 18,
                          color: Colors.orange,
                        ),
                        const SizedBox(width: 2),
                        AppText(
                          text: '$coinコイン',
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.orange,
                        ),
                        const SizedBox(width: 12),
                        const AppIcon(type: AppIconType.settings, size: 18),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              if (isDone)
                const AppIcon(type: AppIconType.checkCircle, size: 28)
              else
                const AppIcon(type: AppIconType.circle, size: 28),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(ColorProperty('labelColor', labelColor))
      ..add(StringProperty('title', title))
      ..add(StringProperty('subTitle', subTitle))
      ..add(IntProperty('coin', coin))
      ..add(DiagnosticsProperty<AppIcon>('icon', icon))
      ..add(DiagnosticsProperty<bool>('isDone', isDone))
      ..add(ObjectFlagProperty<bool>.has('isDisabled', isDisabled))
      ..add(ObjectFlagProperty<VoidCallback?>.has('onTap', onTap));
  }
}
