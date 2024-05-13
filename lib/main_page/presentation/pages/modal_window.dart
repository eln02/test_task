import 'package:flutter/material.dart';
import 'package:test_task/shared/config/theme/colors.dart';
import 'package:test_task/main_page/presentation/widgets/modal_widgets/cities_widget.dart';
import 'package:test_task/main_page/presentation/widgets/modal_widgets/search_widget2.dart';
import '../widgets/modal_widgets/fast_buttons_widget.dart';


void showMyModalBottomSheet(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    constraints: BoxConstraints(
      maxWidth:  MediaQuery.of(context).size.width,
    ),
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.only(top: 40),
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Theme.of(context).appColors.grey2,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 16,
                ),
                Container(
                  width: 38,
                  height: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).appColors.grey5,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const SearchWidget2(),
                const SizedBox(
                  height: 32,
                ),
                const OffersLine(),
                const SizedBox(
                  height: 30,
                ),
                const CitiesWidget(),
                const SizedBox(height: 250)
              ],
            ),
          ),
        ),
      );
    },
  );
}


