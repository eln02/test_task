import '../../data/models/offer_model.dart';
import '../../data/service/offers_api_service.dart';

class OfferRepository {
  final OfferApiService _apiService;

  OfferRepository(this._apiService);

  Future<List<Offer>> getOffers() async {
    Map<String, List<Offer>> offersMap = await _apiService.getOffers();
    return offersMap['offers'] ?? [];
  }
}