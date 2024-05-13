import 'package:json_annotation/json_annotation.dart';

part 'departure_model.g.dart';

@JsonSerializable()
class Departure {
  final String town;
  final String date;
  final String airport;

  Departure({
    required this.town,
    required this.date,
    required this.airport});

  factory Departure.fromJson(Map<String, dynamic> json) => _$DepartureFromJson(json);
  Map<String, dynamic> toJson() => _$DepartureToJson(this);
}