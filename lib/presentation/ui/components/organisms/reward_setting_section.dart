import 'package:family_coin/presentation/ui/components/atoms/app_text_field.dart';
import 'package:family_coin/presentation/ui/components/molecules/choice_chip_row.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// 報酬設定セクション
class RewardSettingSection extends StatelessWidget {

  /// constructor
  const RewardSettingSection({
    required this.taskType, required this.selectedCoinIndex, required this.onCoinSelected, required this.onCoinChanged, super.key,
  });
  /// タスク種別（0:チャレンジ、1:ルーティン）
  final int taskType;

  /// 選択されたコイン数インデックス
  final int selectedCoinIndex;

  /// コイン数選択コールバック
  final ValueChanged<int> onCoinSelected;

  /// コイン数変更コールバック
  final ValueChanged<String> onCoinChanged;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text('報酬設定'),
      Row(
        children: [
          const Text('獲得コイン数'),
          const SizedBox(width: 8),
          SizedBox(
            width: 80,
            child: AppTextField.amount(
              hintText: taskType == 0 ? '例: 100' : '例: 50',
              onChanged: onCoinChanged,
            ),
          ),
          const SizedBox(width: 8),
          const Text('コイン'),
        ],
      ),
      ChoiceChipRow<int>.withIndex(
        choices: taskType == 0 ? [50, 100, 200, 500] : [20, 30, 50, 100],
        selectedIndex: selectedCoinIndex,
        onIndexSelected: onCoinSelected,
      ),
    ],
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(IntProperty('taskType', taskType))
      ..add(IntProperty('selectedCoinIndex', selectedCoinIndex));
      properties.add(ObjectFlagProperty<ValueChanged<int>>.has('onCoinSelected', onCoinSelected));
      properties.add(ObjectFlagProperty<ValueChanged<String>>.has('onCoinChanged', onCoinChanged));
  }
}