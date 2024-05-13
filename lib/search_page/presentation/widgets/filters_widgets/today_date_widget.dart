import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_task/shared/shared_state/date_notifier.dart';
import 'package:test_task/shared/config/theme/colors.dart';

import '../../../../shared/utils/format_time.dart';



class TodayDateWidget extends StatefulWidget {
  const TodayDateWidget({super.key});

  @override
  _TodayDateWidgetState createState() => _TodayDateWidgetState();
}

class _TodayDateWidgetState extends State<TodayDateWidget> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
    );
    if (picked!= null && picked!= selectedDate) {
      setState(() {
        selectedDate = picked;
        Provider.of<DateNotifier>(context, listen: false).setDate(selectedDate);
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
          children: [
            Text(
                DateTimeUtils.getDay(selectedDate),
                style: Theme.of(context).textTheme.labelSmall
            ),
            Text(
                ", ${DateTimeUtils.getDayOfWeek(selectedDate)}",
                style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Theme.of(context).appColors.grey5)
            ),
          ],
        ),
      ),
    );
  }
}

