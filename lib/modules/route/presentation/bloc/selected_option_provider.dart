import 'dart:io';
import 'package:flutter/material.dart';

class SelectedOptionProvider extends ChangeNotifier {
  int selectedTransport;
  int selectedAmbient;
  File? image;

  SelectedOptionProvider({
    this.selectedTransport = 0,
    this.selectedAmbient = 0,
    this.image,
  });

  void changeTransport(int newVal) {
    selectedTransport = newVal;
    notifyListeners();
  }

  void changeAmbient(int newVal) {
    selectedAmbient = newVal;
    notifyListeners();
  }

  void setImage(File newImage) {
    image = newImage;
    notifyListeners();
  }
}
