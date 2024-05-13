import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_task/shared/config/theme/colors.dart';
import '../../../shared/utils/format_price.dart';
import '../../data/models/ticket_offer_model.dart';


class TicketOfferWidget extends StatelessWidget {
  final TicketOffer ticketOffer;

  const TicketOfferWidget({
    super.key, required this.ticketOffer,

  });

  @override
  Widget build(BuildContext context) {

    Map<int, Color>? color = {
      1: Theme.of(context).appColors.red,
      10: Theme.of(context).appColors.blue,
      30: Theme.of(context).appColors.white,
    };

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              margin: const EdgeInsets.only(top: 6),
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color[ticketOffer.id],
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(ticketOffer.title,
                          style: Theme.of(context).textTheme.labelSmall),
                      const Expanded(child: SizedBox()),
                      Text("${formatPrice(ticketOffer.price.value)} ₽",
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(
                                  color: Theme.of(context).appColors.blue)),
                      SvgPicture.asset(
                        "assets/arrow_right.svg",
                        height: 24,
                        width: 24,
                        fit: BoxFit.scaleDown,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(ticketOffer.time_range.join(' '),
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.displaySmall),
                ],
              ),
            )
          ]),
          const SizedBox(
            height: 8,
          ),
          Divider(
            color: Theme.of(context).appColors.grey5,
            thickness: 1,
            height: 1,
          ),
        ],
      ),
    );
  }
}
