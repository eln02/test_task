import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../../shared/config/api_config/config.dart';
import '../models/ticket_model.dart';

part 'ticket_api_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class TicketApiService {
  factory TicketApiService(Dio dio, {String baseUrl}) = _TicketApiService;

  @GET(ticketsPath)
  Future<Map<String, List<Ticket>>> getTickets();
}