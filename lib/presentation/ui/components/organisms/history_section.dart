import 'package:family_coin/presentation/ui/components/molecules/history_list_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// 履歴セクション
class HistorySection extends StatelessWidget {
  /// constructor
  const HistorySection({required this.historyList, super.key, this.onSeeAll});

  /// 履歴リスト
  final List<Map<String, dynamic>> historyList;

  /// すべて見るボタンのコールバック
  final VoidCallback? onSeeAll;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          const Text(
            '最近の交換履歴',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const Spacer(),
          TextButton(onPressed: onSeeAll, child: const Text('すべて見る')),
        ],
      ),
      ...historyList.map(
        (h) => HistoryListItem(
          title: h['title'] as String,
          subtitle: '${h['date']}に交換・${h['coin']}コイン使用',
        ),
      ),
    ],
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(IterableProperty<Map<String, dynamic>>('historyList', historyList))
      ..add(ObjectFlagProperty<VoidCallback?>.has('onSeeAll', onSeeAll));
  }
}
