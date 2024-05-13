import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../data/service/offers_api_service.dart';
import '../../../data/models/offer_model.dart';
import '../../../domain/repositories/offer_repository.dart';
import 'offer_widget.dart';

class OffersWidget extends StatelessWidget {
  final OfferRepository offerRepository =
      OfferRepository(OfferApiService(Dio()));

  OffersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Музыкально отлететь",
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(
            height: 25,
          ),
          FutureBuilder<List<Offer>>(
            future: offerRepository.getOffers(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Offer>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(
                    child: Text(
                  'Ошибка: ${snapshot.error}',
                ));
              } else {
                List<Offer>? offers = snapshot.data;
                if (offers != null) {
                  return SizedBox(
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: offers.length,
                      itemBuilder: (context, index) {
                        return OfferWidget(
                          offer: offers[index],
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
