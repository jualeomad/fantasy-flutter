// lib/constants/custom_colors.dart
import 'package:flutter/material.dart';

class CustomColors {


  static const Color playerSelectionBg = Color(0xFF171717);



  static const Color primaryPurple = Color(0xFF6B3FA0);
  static const Color neonGreen = Color(0xFF39FF14);
  static const Color darkBlue = Color(0xFF1A237E);
  
  // Puedes definir también gradientes predefinidos
  static const LinearGradient purpleGradient = LinearGradient(
    colors: [
      Color(0xFF6B3FA0),
      Color(0xFF9C27B0),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // También puedes crear métodos que retornen gradientes con opacidad personalizada
  static LinearGradient customGradient(Color startColor, Color endColor) {
    return LinearGradient(
      colors: [startColor, endColor],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }
}