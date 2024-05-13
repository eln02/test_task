import 'package:json_annotation/json_annotation.dart';
import '../../../shared/models/price_model.dart';

part 'luggage_model.g.dart';

@JsonSerializable()
class Luggage {
  final bool has_luggage;
  final Price? price;

  Luggage({required this.has_luggage, this.price});

  factory Luggage.fromJson(Map<String, dynamic> json) => _$LuggageFromJson(json);
  Map<String, dynamic> toJson() => _$LuggageToJson(this);
}
