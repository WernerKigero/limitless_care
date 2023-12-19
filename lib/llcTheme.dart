import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData llcTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    // Remove the direct reference to secondaryColor from ThemeData
    textTheme: TextTheme(
      bodyText1: TextStyle(color: Colors.black),
      bodyText2: TextStyle(color: Colors.black),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
      filled: true,
      fillColor: AppColors.secondaryColor, // Use AppColors.secondaryColor here
      labelStyle: TextStyle(
        fontSize: 24,
        color: Colors.black,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24.0),
        borderSide: BorderSide(color: Colors.black),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24.0),
        borderSide: BorderSide(color: Colors.black),
      ),
    ),
  );
}

class AppColors {
  static const Color primaryColor = Color(0xFF01796F); // Deep Blue
  static const Color secondaryColor = Color(0xFFCCCCCC); // Light Grey
  static const LinearGradient primaryColorGradient = LinearGradient(
    colors: [Color(0xFF01796F), Color(0xFFCCCCCC)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}

