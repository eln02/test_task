import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:test_task/shared/config/theme/colors.dart';
import 'package:test_task/search_page/domain/repositories/ticket_offer_repository.dart';
import '../../data/models/ticket_offer_model.dart';
import '../../data/service/ticket_offer_api_service.dart';
import 'ticket_offer_widget.dart';

class TicketsOffersWidget extends StatefulWidget {
  final TicketOfferRepository ticketOfferRepository =
      TicketOfferRepository(TicketOfferApiService(Dio()));

  TicketsOffersWidget({super.key});

  @override
  _TicketsOffersWidgetState createState() => _TicketsOffersWidgetState();
}

class _TicketsOffersWidgetState extends State<TicketsOffersWidget> {
  late Future<List<TicketOffer>> _futureOffers;

  @override
  void initState() {
    super.initState();
    _futureOffers = widget.ticketOfferRepository.getOffers();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).appColors.grey1,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Прямые рейсы",
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(
            height: 8,
          ),
          FutureBuilder<List<TicketOffer>>(
            future: _futureOffers,
            builder: (BuildContext context,
                AsyncSnapshot<List<TicketOffer>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Ошибка: ${snapshot.error}'));
              } else {
                List<TicketOffer>? offers = snapshot.data;
                if (offers != null) {
                  return SizedBox(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: offers.length,
                      itemBuilder: (context, index) {
                        return TicketOfferWidget(
                          ticketOffer: offers[index],
                        );
                      },
                    ),
                  );
                } else {
                  return const Center(
                      child: Text(
                          'Полученные данные не содержат списка предложений'));
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
