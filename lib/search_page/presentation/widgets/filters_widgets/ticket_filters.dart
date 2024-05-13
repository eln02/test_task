import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_task/search_page/presentation/widgets/filters_widgets/back_date_widget.dart';
import 'package:test_task/search_page/presentation/widgets/filters_widgets/today_date_widget.dart';
import 'package:test_task/shared/config/theme/colors.dart';

class TicketFilters extends StatelessWidget {
  const TicketFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const DateBackWidget(),
          const TodayDateWidget(),
          _personFilter(context),
          _filterFilter(context)
        ],
      ),
    );
  }

  Widget _personFilter(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Theme.of(context).appColors.grey3,
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            "assets/person.svg",
            height: 16,
            width: 16,
            fit: BoxFit.scaleDown,
          ),
          const SizedBox(
            width: 8,
          ),
          Text("1,эконом", style: Theme.of(context).textTheme.labelSmall)
        ],
      ),
    );
  }

  Widget _filterFilter(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Theme.of(context).appColors.grey3,
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            "assets/settings.svg",
            height: 16,
            width: 16,
            fit: BoxFit.scaleDown,
          ),
          const SizedBox(
            width: 8,
          ),
          Text("фильтры", style: Theme.of(context).textTheme.labelSmall)
        ],
      ),
    );
  }
}
