import 'package:family_coin/application/provider/wishitem_list_state.dart';
import 'package:family_coin/presentation/ui/components/organisms/coin_balance_section.dart';
import 'package:family_coin/presentation/ui/components/organisms/history_section.dart';
import 'package:family_coin/presentation/ui/components/organisms/wishitem_grid_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// ほしいもの一覧
class WishitemListPage extends ConsumerStatefulWidget {
  /// constructor
  const WishitemListPage({super.key});

  @override
  ConsumerState<WishitemListPage> createState() => _WishitemListPageState();
}

class _WishitemListPageState extends ConsumerState<WishitemListPage> {
  @override
  Widget build(BuildContext context) {
    final wishitemListAsync = ref.watch(wishitemListStateProvider);
    // 仮のコイン残高
    const coinBalance = 1250;
    // 仮の最近の交換履歴
    final recentHistory = [
      {'title': 'アイスクリーム', 'date': '3日前', 'coin': 50},
      {'title': 'ゲーム30分', 'date': '1週間前', 'coin': 30},
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('ごほうび'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        actions: [
          IconButton(icon: const Icon(Icons.more_horiz), onPressed: () {}),
        ],
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // コイン残高
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: CoinBalanceSection(balance: coinBalance, diff: 0),
          ),
          // ごほうびリストタイトル
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Row(
              children: [
                const Icon(Icons.card_giftcard, size: 20),
                const SizedBox(width: 8),
                const Text(
                  '交換できるごほうび',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const Spacer(),
                wishitemListAsync.when(
                  data:
                      (items) => Text(
                        '${items.length}個',
                        style: const TextStyle(color: Colors.grey),
                      ),
                  loading: () => const SizedBox.shrink(),
                  error: (_, _) => const SizedBox.shrink(),
                ),
              ],
            ),
          ),
          // ごほうびグリッド
          Expanded(
            child: wishitemListAsync.when(
              data:
                  (wishitems) => Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    child: WishitemGridSection(
                      wishitems: wishitems,
                      onTap: (wishitem) {
                        // 詳細ページ等へ遷移予定
                      },
                    ),
                  ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) => Center(child: Text('エラー: $error')),
            ),
          ),
          // 最近の交換履歴
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 8, right: 16),
            child: HistorySection(historyList: recentHistory, onSeeAll: () {}),
          ),
          const SizedBox(height: 8),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 56,
          child: FloatingActionButton.extended(
            onPressed: () {},
            label: const Text('＋ 新しいごほうびを追加', style: TextStyle(fontSize: 18)),
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            elevation: 2,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ホーム'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'タスク'),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'ごほうび',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'プロフィール'),
        ],
        currentIndex: 2,
        onTap: (_) {},
      ),
    );
  }
}
