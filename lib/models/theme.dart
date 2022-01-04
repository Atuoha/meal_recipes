import 'package:flutter/material.dart';

class ThemeDataa extends ChangeNotifier {
  bool darkTheme = false;

  toggleDarkTheme() {
    switch (darkTheme) {
      case false:
        darkTheme = true;
        break;

      case true:
        darkTheme = false;
        break;
      default:
    }
  }

  bool isVeganCheck = false;
  bool isLactoseCheck = false;
  bool isVegetarianCheck = false;
  bool isGlutenCheck = false;
}
