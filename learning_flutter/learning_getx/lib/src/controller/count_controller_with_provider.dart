import 'package:flutter/material.dart';

class CountContollerWithProvider extends ChangeNotifier {
  int count = 0;
  void increase() {
    count++;
    notifyListeners();
  }
}
