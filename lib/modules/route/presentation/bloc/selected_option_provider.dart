import 'package:flutter/material.dart';

class SelectedOptionProvider extends ChangeNotifier {
  int selectedTransport;
  int selectedAmbient;

  SelectedOptionProvider({
    this.selectedTransport = 0,
    this.selectedAmbient = 0,
  });

  void changeTransport(int newVal) {
    selectedTransport = newVal;
    notifyListeners();
  }

  void changeAmbient(int newVal) {
    selectedAmbient = newVal;
    notifyListeners();
  }
}
