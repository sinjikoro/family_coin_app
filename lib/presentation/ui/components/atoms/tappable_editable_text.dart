import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// タップで編集可能になるテキストウィジェット
class TappableEditableText extends StatefulWidget {
  /// コンストラクタ
  const TappableEditableText({
    required this.text,
    required this.onChanged,
    this.style,
    super.key,
  });

  /// テキスト
  final String text;

  /// テキスト変更時のコールバック
  final ValueChanged<String> onChanged;

  /// テキストスタイル
  final TextStyle? style;

  @override
  State<TappableEditableText> createState() => _TappableEditableTextState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('text', text))
      ..add(
        ObjectFlagProperty<ValueChanged<String>>.has('onChanged', onChanged),
      )
      ..add(DiagnosticsProperty<TextStyle?>('style', style));
  }
}

class _TappableEditableTextState extends State<TappableEditableText> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.text);
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Container(
    alignment: Alignment.centerLeft,
    height: 48,
    child: _isEditing ? _inputField() : _labelField(),
  );

  /// ラベルフィールド
  GestureDetector _labelField() => GestureDetector(
    onTap: () {
      setState(() => _isEditing = true);
      _focusNode.requestFocus();
    },
    child: Text(
      _controller.text.isEmpty ? 'タップして編集' : _controller.text,
      style: widget.style?.copyWith(
        fontSize: widget.style?.fontSize,
        color:
            _controller.text.isEmpty
                ? Colors.grey.withValues(alpha: 0.6)
                : widget.style?.color,
      ),
    ),
  );

  /// 入力フィールド
  TextField _inputField() => TextField(
    controller: _controller,
    focusNode: _focusNode,
    style: widget.style,
    decoration: const InputDecoration(
      isDense: true,
      contentPadding: EdgeInsets.zero,
      border: InputBorder.none,
    ),
    onSubmitted: (value) {
      setState(() => _isEditing = false);
      widget.onChanged(value);
    },
  );
}
