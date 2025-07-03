import 'package:flutter/material.dart';
import 'package:family_coin/domain/model/wishitem/wishitem.dart';
import 'package:family_coin/domain/value_object/family_coin.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:family_coin/presentation/ui/components/organisms/wishitem_grid_section.dart';

List<Wishitem> _dummyWishitems() => [
  Wishitem(
    wishItemId: WishitemId.generate(),
    name: 'アイスクリーム',
    userId: UserId.generate(),
    price: FamilyCoin(50),
    description: '好きなアイスを1個',
  ),
  Wishitem(
    wishItemId: WishitemId.generate(),
    name: 'ゲーム30分',
    userId: UserId.generate(),
    price: FamilyCoin(30),
    description: '好きなゲームで遊ぶ',
  ),
];

@widgetbook.UseCase(name: 'Default', type: WishitemGridSection)
Widget wishitemGridSectionDefaultUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: SizedBox(
      height: 300,
      child: WishitemGridSection(wishitems: _dummyWishitems()),
    ),
  );
}
