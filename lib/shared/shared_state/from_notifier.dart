import 'package:flutter/foundation.dart';

class FromNotifier extends ChangeNotifier {
  String _from = '';

  String get from => _from;

  void set(String value) {
    _from = value;
    notifyListeners();
  }
}