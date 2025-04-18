import 'package:family_coin/domain/models/base/domain_model.dart';
import 'package:meta/meta.dart';

/// ほしいもの詳細
@immutable
class WishitemDetail extends DomainModel {
  /// Constructor
  const WishitemDetail({this.description = '', this.url});

  /// 説明
  final String description;

  /// 参考URL
  /// ECサイトのURLなど
  final Uri? url;
}
