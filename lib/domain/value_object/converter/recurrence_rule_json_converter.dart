import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rrule/rrule.dart';

/// 繰り返しルールのJSONコンバーター
class RecurrenceRuleJsonConverter
    implements JsonConverter<RecurrenceRule, String> {
  /// Constructor
  const RecurrenceRuleJsonConverter();

  @override
  RecurrenceRule fromJson(String json) => RecurrenceRule.fromString(json);

  @override
  String toJson(RecurrenceRule object) => object.toString();
}
