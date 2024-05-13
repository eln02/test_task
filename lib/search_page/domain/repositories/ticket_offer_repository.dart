import '../../data/models/ticket_offer_model.dart';
import '../../data/service/ticket_offer_api_service.dart';

class TicketOfferRepository {
  final TicketOfferApiService _apiService;

  TicketOfferRepository(this._apiService);

  Future<List<TicketOffer>> getOffers() async {
    Map<String, List<TicketOffer>> offersMap = await _apiService.getOffers();
    return offersMap['tickets_offers'] ?? [];
  }
}

