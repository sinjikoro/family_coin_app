import 'package:family_coin/domain/error/error_code.dart';

/// ドメインエラー
class DomainError implements Exception {
  /// コンストラクタ
  const DomainError({required this.code});

  /// エラーコード
  final ErrorCode code;

  @override
  String toString() => code.code;
}
