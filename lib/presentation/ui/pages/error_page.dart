import 'package:family_coin/presentation/util/extension/context_extension.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// エラーページ
class ErrorPage extends StatelessWidget {
  /// constructor
  const ErrorPage({required this.errorMessage, super.key});

  /// エラーメッセージ
  final String errorMessage;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(context.l10n.errorUnexpected)),
    body: Center(child: Text(errorMessage)),
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('errorMessage', errorMessage));
  }
}
