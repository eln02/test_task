import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:test_task/shared/config/api_config/config.dart';
import '../models/offer_model.dart';

part 'offers_api_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class OfferApiService {
  factory OfferApiService(Dio dio, {String baseUrl}) = _OfferApiService;

  @GET(offersPath)
  Future<Map<String, List<Offer>>> getOffers();
}


