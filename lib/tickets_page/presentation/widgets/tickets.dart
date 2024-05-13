import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:test_task/tickets_page/presentation/widgets/ticket_card.dart';
import '../../data/models/ticket_model.dart';
import '../../data/service/ticket_api_service.dart';
import '../../domain/repositories/ticket_repository.dart';


class TicketCardListView extends StatelessWidget {

  final TicketRepository ticketRepository = TicketRepository(TicketApiService(Dio()));

  TicketCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Ticket>>(
      future: ticketRepository.getTickets(),
      builder: (BuildContext context, AsyncSnapshot<List<Ticket>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Ошибка: ${snapshot.error}',));
        } else {
          List<Ticket>? tickets = snapshot.data;
          if (tickets != null){
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: tickets.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: TicketCard(ticket: tickets[index]),
              );
            },
          );}
          else {
            return const Center(child: Text('Полученные данные не содержат списка предложений'));
          }
        }
      }
      );
  }
}