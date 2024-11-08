// lib/constants/custom_colors.dart
import 'package:flutter/material.dart';

class CustomColors {


  static const Color playerSelectionBg = Color(0xFF171717);

  static const Color ptBackground = Color(0xFFFC4B08);
  static const Color dfBackground = Color(0xFF0000FF);
  static const Color mcBackground = Color(0xFF009413);
  static const Color dlBackground = Color(0xFFFE0000);

  static const Color yellowButton = Color(0xFFF1C40F);

  static const Color playerRowBg = Color(0xFF454545);


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