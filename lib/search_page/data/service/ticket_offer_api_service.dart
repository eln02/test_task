import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../../../shared/config/api_config/config.dart';
import '../models/ticket_offer_model.dart';

part 'ticket_offer_api_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class TicketOfferApiService {
  factory TicketOfferApiService(Dio dio, {String baseUrl}) = _TicketOfferApiService;

  @GET(ticketsOffersPath)
  Future<Map<String, List<TicketOffer>>> getOffers();
}