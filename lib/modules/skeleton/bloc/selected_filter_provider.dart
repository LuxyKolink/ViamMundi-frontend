import 'package:flutter/material.dart';

class SelectedFilterProvider extends ChangeNotifier {
  int selectedFilter;

  SelectedFilterProvider({this.selectedFilter = 0});

  void changeFilter(int newVal) {
    selectedFilter = newVal;
    notifyListeners();
  }
}
