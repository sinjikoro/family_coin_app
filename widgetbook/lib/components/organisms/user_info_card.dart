import 'package:family_coin/domain/value_object/avatar.dart';
import 'package:family_coin/presentation/ui/components/organisms/user_info_card.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: UserInfoCard)
Widget userCoinBalanceCardDefaultUseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16),
    child: UserInfoCard(
      userName: 'たろうくん',
      subText: '今日もがんばろう！',
      avatar: AvatarNone(),
      balance: 1250,
      diff: 50,
    ),
  );
}

@widgetbook.UseCase(name: 'NoDiff', type: UserInfoCard)
Widget userCoinBalanceCardNoDiffUseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16),
    child: UserInfoCard(
      userName: 'たろうくん',
      subText: '今日もがんばろう！',
      avatar: AvatarNone(),
      balance: 800,
    ),
  );
}
