import 'package:family_coin/domain/model/wishitem/wishitem.dart';
import 'package:family_coin/domain/value_object/family_coin.dart';
import 'package:family_coin/presentation/util/extension/context_extension.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// ほしいものフォームウィジェット
class WishitemFormWidget extends StatefulWidget {
  /// constructor
  const WishitemFormWidget({
    required this.wishitem,
    required this.onSave,
    required this.onCancel,
    super.key,
  });

  /// ほしいもの
  final Wishitem wishitem;

  /// 保存時のコールバック
  final Future<void> Function({
    required String name,
    required String description,
    required FamilyCoin price,
    Uri? url,
  })
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
    _descriptionController = TextEditingController(
      text: widget.wishitem.description,
    );
    _priceController = TextEditingController(
      text: widget.wishitem.price.value.toString(),
    );
    _urlController = TextEditingController(
      text: widget.wishitem.url?.toString() ?? '',
    );
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
        TextField(
          controller: _nameController,
          decoration: InputDecoration(labelText: context.l10n.wishItemName),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: _descriptionController,
          decoration: InputDecoration(
            labelText: context.l10n.wishItemDescription,
          ),
          maxLines: 3,
        ),
        const SizedBox(height: 16),
        TextField(
          controller: _priceController,
          decoration: InputDecoration(labelText: context.l10n.wishItemPrice),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 16),
        TextField(
          controller: _urlController,
          decoration: InputDecoration(labelText: context.l10n.wishItemURL),
          keyboardType: TextInputType.url,
        ),
        const SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: widget.onCancel,
              child: const Icon(Icons.cancel),
            ),
            const SizedBox(width: 16),
            ElevatedButton(
              onPressed: () async {
                final price = int.tryParse(_priceController.text);
                if (price == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(context.l10n.wishitemPriceMustBeNumber),
                    ),
                  );
                  return;
                }
                await widget.onSave(
                  name: _nameController.text,
                  description: _descriptionController.text,
                  price: FamilyCoin(price),
                  url:
                      _urlController.text.isNotEmpty
                          ? Uri.parse(_urlController.text)
                          : null,
                );
              },
              child: const Icon(Icons.save),
            ),
          ],
        ),
      ],
    ),
  );
}
