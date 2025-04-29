import 'package:family_coin/domain/value_object/wishitem_id.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// ほしいもの詳細
class WishitemDetail extends StatelessWidget {
  /// constructor
  const WishitemDetail({required this.wishitemId, super.key});

  /// ほしいものID
  final WishitemId wishitemId;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('タスク詳細')),
    body: const Center(child: Text('WishItemDetail')),
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<WishitemId>('wishitemId', wishitemId));
  }
}
