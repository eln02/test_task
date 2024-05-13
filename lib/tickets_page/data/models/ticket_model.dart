import 'package:json_annotation/json_annotation.dart';
import 'package:test_task/tickets_page/data/models/hand_luggage_model.dart';
import 'package:test_task/tickets_page/data/models/luggage_model.dart';
import '../../../shared/models/price_model.dart';
import 'arrival_model.dart';
import 'departure_model.dart';

part 'ticket_model.g.dart';

@JsonSerializable()
class Ticket {
  final int id;
  final String? badge;
  final Price price;
  final String provider_name;
  final String company;
  final Departure departure;
  final Arrival arrival;
  final bool has_transfer;
  final bool has_visa_transfer;
  final Luggage luggage;
  final HandLuggage hand_luggage;
  final bool is_returnable;
  final bool is_exchangable;

  Ticket({
    required this.id,
    this.badge,
    required this.price,
    required this.provider_name,
    required this.company,
    required this.departure,
    required this.arrival,
    required this.has_transfer,
    required this.has_visa_transfer,
    required this.luggage,
    required this.hand_luggage,
    required this.is_returnable,
    required this.is_exchangable,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) => _$TicketFromJson(json);
  Map<String, dynamic> toJson() => _$TicketToJson(this);
}
