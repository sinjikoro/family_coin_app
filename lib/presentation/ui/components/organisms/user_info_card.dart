import 'package:family_coin/domain/value_object/avatar.dart';
import 'package:family_coin/presentation/ui/components/atoms/app_icon.dart';
import 'package:family_coin/presentation/ui/components/atoms/app_text.dart';
import 'package:family_coin/presentation/ui/components/atoms/avatar_icon.dart';
import 'package:family_coin/presentation/ui/theme/spacing.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// ユーザー情報＋コイン残高カード（Organism）
class UserInfoCard extends StatelessWidget {
  /// Constructor
  const UserInfoCard({
    required this.userName,
    required this.subText,
    required this.avatar,
    required this.balance,
    super.key,
    this.diff,
    this.onSettingsTap,
  });

  /// ユーザー名
  final String userName;

  /// サブテキスト
  final String subText;

  /// アバター
  final Avatar avatar;

  /// コイン残高
  final int balance;

  /// コイン差分
  final int? diff;

  /// 設定ボタンタップコールバック
  final VoidCallback? onSettingsTap;

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.primaryContainer,
      borderRadius: BorderRadius.circular(24),
    ),
    padding: Spacing.paddingCardWidget,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ユーザー情報ヘッダー
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AvatarIcon.svgPath(svgPath: avatar.imagePath),
            Spacing.widthM,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.large(text: userName),
                  Spacing.heightXS,
                  AppText.small(text: subText),
                ],
              ),
            ),
            IconButton(
              icon: const AppIcon.settings(size: 24),
              onPressed: onSettingsTap,
            ),
          ],
        ),
        Spacing.heightL,
        // コイン残高表示
        Row(
          children: [
            const AppIcon.coin(size: 32),
            Spacing.widthM,
            AppText.xLarge(text: balance.toString()),
            if (diff != null && diff! > 0) ...[
              Spacing.widthS,
              const AppIcon.arrowUp(size: 18),
              Spacing.widthXS,
              AppText.small(text: '+$diff'),
            ],
          ],
        ),
      ],
    ),
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('userName', userName))
      ..add(StringProperty('subText', subText))
      ..add(IntProperty('balance', balance))
      ..add(IntProperty('diff', diff))
      ..add(
        ObjectFlagProperty<VoidCallback?>.has('onSettingsTap', onSettingsTap),
      )
      ..add(DiagnosticsProperty<Avatar>('avatar', avatar));
  }
}
