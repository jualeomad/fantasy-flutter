import 'package:flutter/material.dart';

final themeData = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.black,
      primary: Color(0xFF686868),
      secondary: Colors.amber,
      surface: Colors.black, // Color para superficies
      onPrimary: Colors.white, // Color del texto sobre el color primario
    ),
    scaffoldBackgroundColor:
        Colors.black, // Color de fondo global para Scaffold
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black, // Color del AppBar
      foregroundColor: Colors.white, // Color del texto e iconos en el AppBar
    ),
    tabBarTheme: TabBarTheme(labelColor: Color(0xFFF1C40F), unselectedLabelColor: Colors.white));
