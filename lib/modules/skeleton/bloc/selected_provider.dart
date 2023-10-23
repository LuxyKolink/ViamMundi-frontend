import 'package:flutter/material.dart';

class SelectedProvider extends ChangeNotifier {
  int selectedPage;
  int selectedFilter;

  SelectedProvider({
    this.selectedPage = 0,
    this.selectedFilter = 0,
  });

  void changePage(int newVal) {
    selectedPage = newVal;
    notifyListeners();
  }

  void changeFilter(int newVal) {
    selectedFilter = newVal;
    notifyListeners();
  }
}
