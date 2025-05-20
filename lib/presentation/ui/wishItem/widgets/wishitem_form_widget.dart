import 'package:family_coin/domain/model/wishitem/wishitem.dart';
import 'package:family_coin/domain/value_object/family_coin.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// ほしいものフォームウィジェット
class WishitemFormWidget extends StatefulWidget {
  /// constructor
  const WishitemFormWidget({required this.wishitem, required this.onSave, required this.onCancel, super.key});

  /// ほしいもの
  final Wishitem wishitem;

  /// 保存時のコールバック
  final Future<void> Function({required String name, required String description, required FamilyCoin price, Uri? url})
  onSave;

  /// キャンセル時のコールバック
  final VoidCallback onCancel;

  @override
  State<WishitemFormWidget> createState() => _WishitemFormWidgetState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<Wishitem>('wishitem', wishitem))
      ..add(
        ObjectFlagProperty<
          Future<void> Function({
            required String description,
            required String name,
            required FamilyCoin price,
            Uri? url,
          })
        >.has('onSave', onSave),
      )
      ..add(ObjectFlagProperty<VoidCallback>.has('onCancel', onCancel));
  }
}

class _WishitemFormWidgetState extends State<WishitemFormWidget> {
  late final TextEditingController _nameController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _priceController;
  late final TextEditingController _urlController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.wishitem.name);
    _descriptionController = TextEditingController(text: widget.wishitem.description);
    _priceController = TextEditingController(text: widget.wishitem.price.value.toString());
    _urlController = TextEditingController(text: widget.wishitem.url?.toString() ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _urlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(controller: _nameController, decoration: const InputDecoration(labelText: '名前')),
        const SizedBox(height: 16),
        TextField(controller: _descriptionController, decoration: const InputDecoration(labelText: '説明'), maxLines: 3),
        const SizedBox(height: 16),
        TextField(
          controller: _priceController,
          decoration: const InputDecoration(labelText: '価格（コイン）'),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 16),
        TextField(
          controller: _urlController,
          decoration: const InputDecoration(labelText: 'URL（任意）'),
          keyboardType: TextInputType.url,
        ),
        const SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(onPressed: widget.onCancel, child: const Text('キャンセル')),
            const SizedBox(width: 16),
            ElevatedButton(
              onPressed: () async {
                final price = int.tryParse(_priceController.text);
                if (price == null) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('価格は数値で入力してください')));
                  return;
                }
                await widget.onSave(
                  name: _nameController.text,
                  description: _descriptionController.text,
                  price: FamilyCoin(price),
                  url: _urlController.text.isNotEmpty ? Uri.parse(_urlController.text) : null,
                );
              },
              child: const Text('保存'),
            ),
          ],
        ),
      ],
    ),
  );
}
