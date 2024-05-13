import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_task/shared/widgets/alert_dialog.dart';
import 'package:test_task/shared/config/theme/colors.dart';
import 'package:test_task/main_page/presentation/widgets/modal_widgets/fast_bitton_widget.dart';

import '../../../../shared/shared_state/to_notifier.dart';


class OffersLine extends StatelessWidget {
  const OffersLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FastButtonWidget(
          onTap: (){showAlert(context);},
          iconPath: 'assets/flower.svg',
          backgroundColor: Theme.of(context).appColors.green,
          text: "Сложный \n маршрут",
        ),
        FastButtonWidget(
          onTap: () {
            Provider.of<ToNotifier>(context, listen: false).set('Куда угодно');
          },
          iconPath: 'assets/planet.svg',
          backgroundColor: Theme.of(context).appColors.blue,
          text: "Куда угодно",
        ),
        FastButtonWidget(
          onTap: (){showAlert(context);},
          iconPath: 'assets/calendar.svg',
          backgroundColor: Theme.of(context).appColors.darkBlue,
          text: "Выходные",
        ),
        FastButtonWidget(
          onTap: (){showAlert(context);},
          iconPath: 'assets/fire.svg',
          backgroundColor: Theme.of(context).appColors.red,
          text: "Горячие \n билеты",
        ),
      ],
    );
  }
}