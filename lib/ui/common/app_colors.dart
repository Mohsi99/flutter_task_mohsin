import 'package:flutter/material.dart';

/// App-wide color constants extracted from the Figma design.
class AppColors {
  AppColors._();

  // --- Primary Gradient (App Bar) ---
  static const Color gradientStart = Color(0xFF4A90D9);
  static const Color gradientEnd = Color(0xFF5AC8FA);

  static const LinearGradient appBarGradient = LinearGradient(
    colors: [gradientStart, gradientEnd],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  // --- Brand ---
  static const Color primaryBlue = Color(0xFF4A90D9);
  static const Color selectedBorder = Color(0xFF4A90D9);

  // --- Accent ---
  static const Color checkoutGreen = Color(0xFF2DD4A8);
  static const Color selectedPriceRed = Color(0xFFE74C5A);

  // --- Text ---
  static const Color textPrimary = Color(0xFF001C3E);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textPrice = Color(0xFF2563EB);
  static const Color textWhite = Colors.white;

  // --- Backgrounds ---
  static const Color background = Color(0xFFF8F9FA);
  static const Color cardBackground = Colors.white;
  static const Color searchBarBackground = Color(0xFFF1F3F5);

  // --- Chip ---
  static const Color chipSelectedBg = Color(0xFF329CFB);
  static const Color chipUnselectedBg = Colors.white;
  static const Color chipBorder = Color(0xFFD1D5DB);

  // --- Country chip ---
  static const Color countryChipRed = Color(0xFFE74C5A);

  // --- Misc ---
  static const Color divider = Color(0xFFE5E7EB);
  static const Color cartBarBackground = Colors.white;
  static const Color removeIcon = Color(0xFFEF4444);
}
