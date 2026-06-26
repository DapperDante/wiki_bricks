import 'package:flutter/material.dart';

class ThemeCustom {
  // Colores base de la marca
  static const Color primaryLego = Color(0xFFFFD500); // Amarillo clásico
  static const Color secondaryLego = Color(0xFFDC0F2D); // Rojo LEGO

  // Configuración de Tema Light
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryLego,
        primary: primaryLego,
        secondary: secondaryLego,
        surface: Color(0xFFF8F9FA),
        onSurface: Color(0xFF212121),
        brightness: Brightness.light,
      ),
    );
  }

  // Configuración de Tema Dark
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryLego,
        primary: primaryLego,
        secondary: secondaryLego,
        surface: Color(0xFF121212),
        onSurface: Color(0xFFE0E0E0),
        brightness: Brightness.dark,
      ),
    );
  }
}