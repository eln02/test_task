import 'package:flutter/material.dart';
import 'package:test_task/shared/config/theme/colors.dart';
import 'city_widget.dart';

class CitiesWidget extends StatelessWidget {
  const CitiesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).appColors.grey3,
      ),
      child: const Column(
        children: [
          CityWidget(imagePath: "assets/Istanbul.jpg", title: "Стамбул"),
          CityWidget(imagePath: "assets/Sochi.jpg", title: "Сочи"),
          CityWidget(imagePath: "assets/phuket.png", title: "Пхукет"),
        ],
      ),
    );
  }
}
