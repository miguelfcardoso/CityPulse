import 'package:flutter/material.dart';

/// Theme manager for Light/Dark mode with premium colors
class AppTheme {
  // Light Theme Colors
  static const Color _lightPrimary = Color(0xFF6366F1);
  static const Color _lightSecondary = Color(0xFFEC4899);
  static const Color _lightTertiary = Color(0xFF8B5CF6);
  static const Color _lightBackground = Color(0xFFF8FAFC);
  static const Color _lightSurface = Color(0xFFFFFFFF);
  static const Color _lightTextPrimary = Color(0xFF0F172A);
  static const Color _lightTextSecondary = Color(0xFF64748B);

  // Dark Theme Colors
  static const Color _darkPrimary = Color(0xFF818CF8);
  static const Color _darkSecondary = Color(0xFFF472B6);
  static const Color _darkTertiary = Color(0xFFA78BFA);
  static const Color _darkBackground = Color(0xFF0F172A);
  static const Color _darkSurface = Color(0xFF1E293B);
  static const Color _darkTextPrimary = Color(0xFFF8FAFC);
  static const Color _darkTextSecondary = Color(0xFF94A3B8);

  // Category Colors (same for both themes)
  static const Color monuments = Color(0xFF6366F1);
  static const Color museums = Color(0xFF8B5CF6);
  static const Color gastronomy = Color(0xFFEC4899);
  static const Color parks = Color(0xFF10B981);
  static const Color culture = Color(0xFFF59E0B);

  /// Light Theme
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: _lightPrimary,
      scaffoldBackgroundColor: _lightBackground,
      colorScheme: ColorScheme.light(
        primary: _lightPrimary,
        secondary: _lightSecondary,
        tertiary: _lightTertiary,
        surface: _lightSurface,
        background: _lightBackground,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: _lightTextPrimary,
        onBackground: _lightTextPrimary,
      ),
      useMaterial3: true,

      // AppBar Theme
      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: _lightTextPrimary,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: _lightTextPrimary,
          letterSpacing: 0.5,
        ),
      ),

      // Card Theme
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        clipBehavior: Clip.antiAlias,
        color: _lightSurface,
      ),

      // Text Theme
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 56,
          fontWeight: FontWeight.w800,
          color: _lightTextPrimary,
          letterSpacing: -1,
          height: 1.1,
        ),
        headlineLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          color: _lightTextPrimary,
          letterSpacing: -0.5,
        ),
        headlineMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: _lightTextPrimary,
        ),
        titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: _lightTextSecondary,
          letterSpacing: 0.15,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: _lightTextSecondary,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: _lightTextSecondary,
          height: 1.6,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: _lightTextSecondary,
          height: 1.5,
        ),
      ),

      // FAB Theme
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),

      // Bottom Navigation Theme
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 0,
        backgroundColor: _lightSurface,
        selectedItemColor: _lightPrimary,
        unselectedItemColor: Color(0xFF94A3B8),
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
      ),
    );
  }

  /// Dark Theme
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: _darkPrimary,
      scaffoldBackgroundColor: _darkBackground,
      colorScheme: ColorScheme.dark(
        primary: _darkPrimary,
        secondary: _darkSecondary,
        tertiary: _darkTertiary,
        surface: _darkSurface,
        background: _darkBackground,
        onPrimary: _darkBackground,
        onSecondary: _darkBackground,
        onSurface: _darkTextPrimary,
        onBackground: _darkTextPrimary,
      ),
      useMaterial3: true,

      // AppBar Theme
      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: _darkTextPrimary,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: _darkTextPrimary,
          letterSpacing: 0.5,
        ),
      ),

      // Card Theme
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        clipBehavior: Clip.antiAlias,
        color: _darkSurface,
      ),

      // Text Theme
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 56,
          fontWeight: FontWeight.w800,
          color: _darkTextPrimary,
          letterSpacing: -1,
          height: 1.1,
        ),
        headlineLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          color: _darkTextPrimary,
          letterSpacing: -0.5,
        ),
        headlineMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: _darkTextPrimary,
        ),
        titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: _darkTextSecondary,
          letterSpacing: 0.15,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: _darkTextSecondary,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: _darkTextSecondary,
          height: 1.6,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: _darkTextSecondary,
          height: 1.5,
        ),
      ),

      // FAB Theme
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),

      // Bottom Navigation Theme
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 0,
        backgroundColor: _darkSurface,
        selectedItemColor: _darkPrimary,
        unselectedItemColor: Color(0xFF475569),
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
      ),
    );
  }
}

