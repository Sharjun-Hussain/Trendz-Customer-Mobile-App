import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:trendz_customer/theming/app_colors.dart';

final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.gold,
    hintColor: AppColors.white,
    scaffoldBackgroundColor: AppColors.blackSecondary, // App background
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.blackSecondary, // App bar
      foregroundColor: AppColors.gold, // App bar text
    ),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.ubuntu(
        fontSize: 24,
        color: AppColors.white, // Primary text
      ),
      bodyMedium: GoogleFonts.ubuntu(
        fontSize: 18,
        color: AppColors.white, // Secondary text
      ),
      bodySmall: GoogleFonts.ubuntu(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: AppColors.white, // Headline
      ),

      // Headline for dark black color

      headlineLarge: GoogleFonts.ubuntu(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColors.gold,
      ),
      headlineMedium: GoogleFonts.ubuntu(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.gold,
      ),
      headlineSmall: GoogleFonts.ubuntu(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.gold,
      ),

      // Headline for gold color

      titleLarge: GoogleFonts.ubuntu(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColors.black,
      ),
      titleMedium: GoogleFonts.ubuntu(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: AppColors.black, // Headline
      ),
      titleSmall: GoogleFonts.ubuntu(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.black, // Headline
      ),
    ),
    cardColor: AppColors.black, // Card background
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.gold, // Button background
          foregroundColor: AppColors.black),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        unselectedItemColor: AppColors.white,
        selectedLabelStyle:
            TextStyle(decorationThickness: 2, fontWeight: FontWeight.bold)));
