import 'package:meta/meta.dart';

/// ドメインモデル基底クラス
@immutable
abstract class DomainModel {
  /// Constructor
  const DomainModel();

  /// 等価性
  @override
  bool operator ==(Object other);

  /// ハッシュコード
  @override
  int get hashCode;
}
