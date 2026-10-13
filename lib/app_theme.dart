import 'package:flutter/material.dart';

class AppTheme {
  // Brown color palette
  static const Color darkBrown = Color(0xFF4E342E);
  static const Color coffeeBrown = Color(0xFF795548);
  static const Color mediumBrown = Color(0xFFA1887F);
  static const Color caramel = Color(0xFFBCA078);
  static const Color cream = Color(0xFFF8F3ED);
  static const Color warmWhite = Color(0xFFFFFCF8);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,

      // Main colors
      colorScheme: ColorScheme.fromSeed(
        seedColor: coffeeBrown,
        brightness: Brightness.light,
        primary: coffeeBrown,
        secondary: caramel,
        surface: warmWhite,
      ),

      scaffoldBackgroundColor: cream,

      // AppBar
      appBarTheme: const AppBarTheme(
        backgroundColor: darkBrown,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),

      // Text fields
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: warmWhite,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: mediumBrown),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: mediumBrown),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: coffeeBrown, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
        labelStyle: const TextStyle(color: darkBrown),
        prefixIconColor: coffeeBrown,
      ),

      // Main buttons
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: coffeeBrown,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 52),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          elevation: 0,
        ),
      ),

      // Text buttons
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: darkBrown,
          textStyle: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),

      // Cards
      cardTheme: CardThemeData(
        color: warmWhite,
        elevation: 2,
        shadowColor: darkBrown.withValues(alpha: 0.08),
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),

      // SnackBars
      snackBarTheme: SnackBarThemeData(
        backgroundColor: darkBrown,
        contentTextStyle: const TextStyle(color: Colors.white, fontSize: 14),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),

      // Dividers
      dividerTheme: const DividerThemeData(
        color: Color(0xFFE5D8CC),
        thickness: 1,
      ),
    );
  }
}
