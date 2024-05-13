import 'package:flutter/foundation.dart';
import '../utils/format_time.dart';

class DateNotifier extends ChangeNotifier {
  DateTime _date = DateTime.now();

  DateTime get date => _date;

  void setDate(DateTime newDate){
    _date = newDate;
    notifyListeners();
  }

  String getFullDate(){
    return DateTimeUtils.getFullDate(date);
  }
}