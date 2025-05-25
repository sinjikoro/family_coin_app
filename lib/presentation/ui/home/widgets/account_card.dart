import 'package:family_coin/presentation/ui/common/widgets/tappable_editable_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// アカウントカード
class AccountCard extends StatelessWidget {
  /// constructor
  const AccountCard({
    required this.name,
    required this.balance,
    required this.nameOnChanged,
    super.key,
  });

  /// 名前
  final String name;

  /// 残高
  final int balance;

  /// 名前変更時のコールバック
  final ValueChanged<String> nameOnChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              theme.colorScheme.primaryContainer,
              theme.colorScheme.primaryContainer.withAlpha(204),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(
                  Icons.account_circle_rounded,
                  color: theme.colorScheme.onPrimaryContainer,
                  size: 24,
                ),
                const SizedBox(width: 8),
                TappableEditableText(
                  text: name,
                  onChanged: nameOnChanged,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '残高',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onPrimaryContainer.withAlpha(204),
                  ),
                ),
                Text(
                  '$balance コイン',
                  style: theme.textTheme.headlineMedium?.copyWith(
                    color: theme.colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(IntProperty('balance', balance))
      ..add(StringProperty('name', name))
      ..add(
        ObjectFlagProperty<ValueChanged<String>>.has(
          'nameOnChanged',
          nameOnChanged,
        ),
      );
  }
}
