import 'package:json_annotation/json_annotation.dart';

part 'hand_luggage_model.g.dart';

@JsonSerializable()
class HandLuggage {
  final bool has_hand_luggage;
  final String? size;

  HandLuggage({required this.has_hand_luggage, this.size});

  factory HandLuggage.fromJson(Map<String, dynamic> json) => _$HandLuggageFromJson(json);
  Map<String, dynamic> toJson() => _$HandLuggageToJson(this);
}