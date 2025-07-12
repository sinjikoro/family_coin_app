import 'package:family_coin/presentation/ui/components/molecules/choice_chip_row.dart';
import 'package:family_coin/presentation/ui/components/molecules/icon_choice_row.dart';
import 'package:family_coin/presentation/ui/components/organisms/preview_section.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// ごほうび設定ページ
class WishitemSettingPage extends StatefulWidget {
  /// コンストラクタ
  const WishitemSettingPage({super.key});

  @override
  State<WishitemSettingPage> createState() => _WishitemSettingPageState();
}

class _WishitemSettingPageState extends State<WishitemSettingPage> {
  /// カテゴリ選択
  int selectedCategory = 0;

  /// アイコン選択
  int selectedIcon = 0;

  /// コイン数選択
  int selectedCoin = 1;

  /// ごほうび名
  String wishitemName = '';

  /// 説明
  String description = '';

  /// カテゴリ
  final categories = ['食べ物', '娯楽', '体験', '物品'];

  /// アイコン
  final List<IconData> icons = [
    Icons.icecream,
    Icons.local_pizza,
    Icons.sports_esports,
    Icons.card_giftcard,
    Icons.book,
    Icons.favorite,
  ];

  /// コイン数
  final coinAmounts = [30, 50, 100, 200, 500];

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('ごほうび設定'),
      actions: [
        TextButton(
          onPressed: () {},
          child: const Text('保存', style: TextStyle(color: Colors.white)),
        ),
      ],
    ),
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 新規作成・管理ボタン
          Row(
            children: [
              ElevatedButton(onPressed: () {}, child: const Text('新規作成')),
              const SizedBox(width: 8),
              OutlinedButton(onPressed: () {}, child: const Text('管理')),
            ],
          ),
          const SizedBox(height: 16),
          // ごほうび名
          const Text('ごほうび名'),
          TextField(
            decoration: const InputDecoration(hintText: '例: 新しいゲーム'),
            onChanged: (v) => setState(() => wishitemName = v),
          ),
          const SizedBox(height: 16),
          // 説明
          const Text('説明'),
          TextField(
            decoration: const InputDecoration(
              hintText: '例: 欲しかったゲームソフトを1本プレゼント',
            ),
            onChanged: (v) => setState(() => description = v),
          ),
          const SizedBox(height: 16),
          // カテゴリ
          const Text('カテゴリ'),
          ChoiceChipRow<String>.withIndex(
            choices: categories,
            selectedIndex: selectedCategory,
            onIndexSelected: (i) => setState(() => selectedCategory = i),
          ),
          const SizedBox(height: 16),
          // アイコン
          const Text('アイコン'),
          IconChoiceRow(
            icons: icons,
            selectedIndex: selectedIcon,
            onSelected: (i) => setState(() => selectedIcon = i),
          ),
          const SizedBox(height: 16),
          // コスト設定
          const Text('コスト設定'),
          Row(
            children: [
              const Text('必要コイン数'),
              const SizedBox(width: 8),
              SizedBox(
                width: 80,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: TextEditingController(
                    text: coinAmounts[selectedCoin].toString(),
                  ),
                  onChanged: (v) {},
                ),
              ),
              const SizedBox(width: 8),
              const Text('コイン'),
            ],
          ),
          ChoiceChipRow<int>.withIndex(
            choices: coinAmounts,
            selectedIndex: selectedCoin,
            onIndexSelected: (i) => setState(() => selectedCoin = i),
          ),
          const SizedBox(height: 24),
          // プレビュー
          PreviewSection(
            title: wishitemName.isEmpty ? 'アイスクリーム' : wishitemName,
            subTitle: description.isEmpty ? '好きなアイスを1個' : description,
            icon: icons[selectedIcon],
            category: categories[selectedCategory],
            coin: coinAmounts[selectedCoin],
          ),
        ],
      ),
    ),
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(IntProperty('selectedCategory', selectedCategory))
      ..add(IntProperty('selectedIcon', selectedIcon))
      ..add(IntProperty('selectedCoin', selectedCoin))
      ..add(StringProperty('wishitemName', wishitemName))
      ..add(StringProperty('description', description))
      ..add(IterableProperty<String>('categories', categories))
      ..add(IterableProperty<int>('coinAmounts', coinAmounts))
      ..add(IterableProperty<IconData>('icons', icons));
  }
}
