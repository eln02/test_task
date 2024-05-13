import '../../data/models/ticket_model.dart';
import '../../data/service/ticket_api_service.dart';

class TicketRepository {
  final TicketApiService _apiService;

  TicketRepository(this._apiService);

  Future<List<Ticket>> getTickets() async {
    Map<String, List<Ticket>> offersMap = await _apiService.getTickets();
    return offersMap['tickets'] ?? [];
  }
}