import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFFFFD700);
  static const Color secondary = Color(0xFF2979FF);
  static const Color background = Color(0xFF0F1118);
  static const Color surface = Color(0xFF171B26);
  static const Color card = Color(0xFF202636);
  static const Color textPrimary = Color(0xFFF0F4F8);
  static const Color textSecondary = Color(0xFF90A4AE);

  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: background,
      primaryColor: primary,
      colorScheme: const ColorScheme.dark(
        primary: primary,
        secondary: secondary,
        surface: surface,
      ),
      cardTheme: const CardThemeData(
        color: card,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: surface,
        indicatorColor: primary.withValues(alpha: 0.25),
      ),
    );
  }
}
