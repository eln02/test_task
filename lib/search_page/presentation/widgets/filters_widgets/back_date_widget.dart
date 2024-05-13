import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_task/shared/config/theme/colors.dart';

import '../../../../shared/utils/format_time.dart';


class DateBackWidget extends StatefulWidget {
  const DateBackWidget({super.key});

  @override
  _DateBackWidgetState createState() => _DateBackWidgetState();
}

class _DateBackWidgetState extends State<DateBackWidget> {
  DateTime selectedDate = DateTime.now();
  bool isDateSelected = false;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
    );
    if (picked!= null && picked!= selectedDate) {
      setState(() {
        selectedDate = picked;
        isDateSelected = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Theme.of(context).appColors.grey3,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              "assets/plus.svg",
              height: 16,
              width: 16,
              fit: BoxFit.scaleDown,
            ),
            const SizedBox(width: 8,),
            Text(
                isDateSelected? DateTimeUtils.getDay(selectedDate) : "обратно",
                style: Theme.of(context).textTheme.labelSmall
            ),
            Text(
                isDateSelected? ", ${DateTimeUtils.getDayOfWeek(selectedDate)}" : "",
                style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Theme.of(context).appColors.grey5)
            ),
          ],
        ),
      ),
    );
  }
}
