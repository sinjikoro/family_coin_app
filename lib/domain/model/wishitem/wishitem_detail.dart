import 'package:freezed_annotation/freezed_annotation.dart';

part 'wishitem_detail.freezed.dart';
part 'wishitem_detail.g.dart';

/// ほしいもの詳細
@freezed
abstract class WishitemDetail with _$WishitemDetail {
  /// Constructor
  const factory WishitemDetail({@Default('') String description, Uri? url}) = _WishitemDetail;

  /// Constructor
  const WishitemDetail._();

  /// fromJson
  factory WishitemDetail.fromJson(Map<String, dynamic> json) => _$WishitemDetailFromJson(json);
}
