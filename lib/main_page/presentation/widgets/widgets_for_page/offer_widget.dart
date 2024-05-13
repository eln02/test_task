import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../shared/utils/format_price.dart';
import '../../../data/models/offer_model.dart';

class OfferWidget extends StatelessWidget {

  final Offer offer;

  const OfferWidget(
      {super.key,
      required this.offer});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: SizedBox(
                height: 132,
                width: 132,
                child: Image.asset('assets/img_${offer.id}.png', fit: BoxFit.cover)),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            offer.title,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            offer.town,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            children: [
              SvgPicture.asset(
                height: 24,
                width: 24,
                'assets/plane.svg',
                fit: BoxFit.scaleDown,
              ),
              Text(
                "от ${formatPrice(offer.price.value)} ₽",
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ],
          )
        ],
      ),
    );
  }
}
