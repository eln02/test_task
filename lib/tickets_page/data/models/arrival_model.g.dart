// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'arrival_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Arrival _$ArrivalFromJson(Map<String, dynamic> json) => Arrival(
      town: json['town'] as String,
      date: json['date'] as String,
      airport: json['airport'] as String,
    );

Map<String, dynamic> _$ArrivalToJson(Arrival instance) => <String, dynamic>{
      'town': instance.town,
      'date': instance.date,
      'airport': instance.airport,
    };
