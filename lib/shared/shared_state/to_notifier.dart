import 'package:flutter/cupertino.dart';

class ToNotifier extends ChangeNotifier {
  String _to = '';

  String get to => _to;

  void set(String value) {
    _to = value;
    notifyListeners();
  }
}
