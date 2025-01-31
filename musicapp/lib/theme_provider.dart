import 'package:flutter/material.dart';
// Import the settings page

class ThemeProvider with ChangeNotifier {
  bool _isDarkTheme = true; // Default theme is dark

  bool get isDarkTheme => _isDarkTheme;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners(); // Notify listeners to rebuild the UI
  }
}
