import 'package:flutter/material.dart';

class NavigationProvider with ChangeNotifier {
  int currentIndex = 0;

  get getIndex => currentIndex;

  void setCurrentIndex(index) {
    currentIndex = index;
    notifyListeners();
  }
}
