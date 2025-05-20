import 'package:family_coin/domain/value_object/approval_status.dart';
import 'package:family_coin/domain/value_object/family_coin.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// ほしいもの読み取り専用ウィジェット
class WishitemReadOnlyWidget extends StatelessWidget {
  /// constructor
  const WishitemReadOnlyWidget({
    required this.wishitemName,
    required this.wishitemDescription,
    required this.wishitemPrice,
    required this.wishitemApprovalStatus,
    this.wishitemUrl,
    super.key,
  });

  /// ほしいもの名
  final String wishitemName;

  /// ほしいものの説明
  final String wishitemDescription;

  /// ほしいものの価格
  final FamilyCoin wishitemPrice;

  /// ほしいもののURL
  final Uri? wishitemUrl;

  /// 承認状態
  final ApprovalStatus wishitemApprovalStatus;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(wishitemName, style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 8),
        Text('${wishitemPrice.value}コイン', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 16),
        Text('説明', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        Text(wishitemDescription),
        if (wishitemUrl != null) ...[
          const SizedBox(height: 16),
          Text('URL', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          InkWell(
            onTap: () {
              // TODO(naga): URLを開く処理を実装
            },
            child: Text(
              wishitemUrl.toString(),
              style: const TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
            ),
          ),
        ],
        const SizedBox(height: 16),
        Text('承認状態', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        Text(wishitemApprovalStatus.toString()),
      ],
    ),
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('wishitemName', wishitemName))
      ..add(StringProperty('wishitemDescription', wishitemDescription))
      ..add(DiagnosticsProperty<FamilyCoin>('wishitemPrice', wishitemPrice))
      ..add(DiagnosticsProperty<Uri?>('wishitemUrl', wishitemUrl))
      ..add(DiagnosticsProperty<ApprovalStatus>('wishitemApprovalStatus', wishitemApprovalStatus));
  }
}
