import 'package:json_annotation/json_annotation.dart';

part 'arrival_model.g.dart';

@JsonSerializable()
class Arrival {
  final String town;
  final String date;
  final String airport;

  Arrival({
    required this.town,
    required this.date,
    required this.airport});

  factory Arrival.fromJson(Map<String, dynamic> json) => _$ArrivalFromJson(json);
  Map<String, dynamic> toJson() => _$ArrivalToJson(this);
}
