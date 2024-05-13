import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class DateTimeUtils {

  static String getTimeFromDateTime(String dateTime) {
    DateTime parsedDateTime = DateTime.parse(dateTime);
    String formattedTime = DateFormat('HH:mm').format(parsedDateTime);
    return formattedTime;
  }

  static String calculateTimeDifference(String sDateTime1, String sDateTime2) {
    DateTime dateTime1 = DateTime.parse(sDateTime1);
    DateTime dateTime2 = DateTime.parse(sDateTime2);
    Duration difference = dateTime2.difference(dateTime1);
    int minutes = difference.inMinutes;
    int hours = minutes ~/ 60;
    int restMin = minutes % 60;
    if (restMin <= 15){
      return hours.toString();
    }
    if (restMin <= 45){
      return '$hours.5';
    }
    return '${hours+1}';
  }


  static String getDay(DateTime dateTime){
    initializeDateFormatting('ru_RU', null);
    final formatter = DateFormat('d MMM', 'ru_RU');
    return formatter.format(dateTime).replaceAll('.', '');
  }

  static String getDayOfWeek(DateTime dateTime){
    initializeDateFormatting('ru_RU', null);
    final formatter = DateFormat('EE', 'ru_RU');
    return formatter.format(dateTime);
  }

  static String getFullDate(DateTime dateTime){
    initializeDateFormatting('ru_RU', null);
    final formatter = DateFormat('d MMMM', 'ru_RU');
    return formatter.format(dateTime).replaceAll('.', '');
  }

}
