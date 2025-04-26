// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wishitem_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WishitemDetail {

 String get description; Uri? get url;
/// Create a copy of WishitemDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WishitemDetailCopyWith<WishitemDetail> get copyWith => _$WishitemDetailCopyWithImpl<WishitemDetail>(this as WishitemDetail, _$identity);

  /// Serializes this WishitemDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WishitemDetail&&(identical(other.description, description) || other.description == description)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,description,url);

@override
String toString() {
  return 'WishitemDetail(description: $description, url: $url)';
}


}

/// @nodoc
abstract mixin class $WishitemDetailCopyWith<$Res>  {
  factory $WishitemDetailCopyWith(WishitemDetail value, $Res Function(WishitemDetail) _then) = _$WishitemDetailCopyWithImpl;
@useResult
$Res call({
 String description, Uri? url
});




}
/// @nodoc
class _$WishitemDetailCopyWithImpl<$Res>
    implements $WishitemDetailCopyWith<$Res> {
  _$WishitemDetailCopyWithImpl(this._self, this._then);

  final WishitemDetail _self;
  final $Res Function(WishitemDetail) _then;

/// Create a copy of WishitemDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? description = null,Object? url = freezed,}) {
  return _then(_self.copyWith(
description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as Uri?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _WishitemDetail extends WishitemDetail {
  const _WishitemDetail({this.description = '', this.url}): super._();
  factory _WishitemDetail.fromJson(Map<String, dynamic> json) => _$WishitemDetailFromJson(json);

@override@JsonKey() final  String description;
@override final  Uri? url;

/// Create a copy of WishitemDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WishitemDetailCopyWith<_WishitemDetail> get copyWith => __$WishitemDetailCopyWithImpl<_WishitemDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WishitemDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WishitemDetail&&(identical(other.description, description) || other.description == description)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,description,url);

@override
String toString() {
  return 'WishitemDetail(description: $description, url: $url)';
}


}

/// @nodoc
abstract mixin class _$WishitemDetailCopyWith<$Res> implements $WishitemDetailCopyWith<$Res> {
  factory _$WishitemDetailCopyWith(_WishitemDetail value, $Res Function(_WishitemDetail) _then) = __$WishitemDetailCopyWithImpl;
@override @useResult
$Res call({
 String description, Uri? url
});




}
/// @nodoc
class __$WishitemDetailCopyWithImpl<$Res>
    implements _$WishitemDetailCopyWith<$Res> {
  __$WishitemDetailCopyWithImpl(this._self, this._then);

  final _WishitemDetail _self;
  final $Res Function(_WishitemDetail) _then;

/// Create a copy of WishitemDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? description = null,Object? url = freezed,}) {
  return _then(_WishitemDetail(
description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as Uri?,
  ));
}


}

// dart format on
