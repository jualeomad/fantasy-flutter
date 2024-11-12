import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  // Variable para mantener la pantalla actual, por ejemplo "Home" o "Profile"
  String _currentScreen = 'LigaScreen';

  // Getter para obtener la pantalla actual
  String get currentScreen => _currentScreen;

  // Método para actualizar la pantalla actual
  void setCurrentScreen(String screen) {
    _currentScreen = screen;
    notifyListeners(); // Notifica a los widgets dependientes para que se actualicen
  }
}