import 'package:flutter/material.dart';
import 'package:test_task/shared/config/theme/colors.dart';
import '../../../shared/utils/format_price.dart';
import '../../../shared/utils/format_time.dart';
import '../../data/models/ticket_model.dart';

class TicketCard extends StatelessWidget {


  final Ticket ticket;

  const TicketCard({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    String arrivalTime = DateTimeUtils.getTimeFromDateTime(ticket.arrival.date);
    String departureTime = DateTimeUtils.getTimeFromDateTime(ticket.departure.date);
    String timeDif = DateTimeUtils.calculateTimeDifference(ticket.departure.date, ticket.arrival.date);
    return Container(
      margin: EdgeInsets.only(top: ticket.badge != null ? 12 : 0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(top: 21, bottom: 16, right: 16, left: 16),
            decoration: BoxDecoration(
              color: Theme.of(context).appColors.grey1,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${formatPrice(ticket.price.value)} ₽", style: Theme.of(context).textTheme.displayLarge),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 6),
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).appColors.red,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              departureTime,
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                            Text(' — ',
                              style: Theme.of(context).textTheme.labelSmall?.copyWith(color: const Color(0xFF9F9F9F)),
                            ),
                            Text(
                              arrivalTime,
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Text(
                              '$timeDifч в пути',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                            Visibility(
                              visible: !ticket.has_transfer,
                              child: Row(
                                children: [
                                  const Text(' / ', style: TextStyle(color: Color(0xFF9F9F9F)),),
                                  Text('Без пересадок', style: Theme.of(context).textTheme.displaySmall,),
                                ],
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "${ticket.departure.airport}         ${ticket.arrival.airport}",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(color: const Color(0xFF9F9F9F)),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          _badge(context),
        ],
      ),
    );
  }

  Widget _badge(BuildContext context) {
    return Visibility(
      visible: ticket.badge != null,
      child: Positioned(
        left: 0,
        top: -12,
        child: Container(
          height: 24,
          alignment: Alignment.center,
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 4),
          decoration: BoxDecoration(
            color: Theme.of(context).appColors.blue,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Text(ticket.badge ?? '',
              style: Theme.of(context).textTheme.labelSmall),
        ),
      ),
    );
  }
}
