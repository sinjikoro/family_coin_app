import 'package:flutter/material.dart';
import 'package:family_coin/domain/model/wishitem/wishitem.dart';
import 'package:family_coin/domain/value_object/family_coin.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:family_coin/presentation/ui/components/molecules/wishitem_card.dart';

Wishitem _dummyWishitem({String? name, String? description, int? coin}) =>
    Wishitem(
      wishItemId: WishitemId.generate(),
      name: name ?? 'アイスクリーム',
      userId: UserId.generate(),
      price: FamilyCoin(coin ?? 50),
      description: description ?? '好きなアイスを1個',
    );

@widgetbook.UseCase(name: 'Default', type: WishitemCard)
Widget wishitemCardDefaultUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: WishitemCard(
      wishitem: _dummyWishitem(),
      icon: Icons.icecream,
      backgroundColor: Colors.yellow[100],
      onTap: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'With Long Description', type: WishitemCard)
Widget wishitemCardLongDescUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: WishitemCard(
      wishitem: _dummyWishitem(
        name: '新しい本',
        description: '欲しい本を1冊。とても長い説明文がここに入ります。とても長い説明文がここに入ります。',
        coin: 120,
      ),
      icon: Icons.book,
      backgroundColor: Colors.green[50],
      onTap: () {},
    ),
  );
}
