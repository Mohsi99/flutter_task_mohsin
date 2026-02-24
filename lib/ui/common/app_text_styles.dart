import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle get _baseStyle => GoogleFonts.inter();

  // --- Headers ---
  static TextStyle get appBarTitle => _baseStyle.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.textWhite,
      );

  static TextStyle get sectionTitle => _baseStyle.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        color: Color(0xff001C3E),
      );

  static TextStyle get sectionSubtitle => _baseStyle.copyWith(
        fontSize: 13,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
      );

  // --- Bundle Card ---
  static TextStyle get bundleDataAmount => _baseStyle.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: Color(0xff122644),
      );

  static TextStyle get bundleValidity => _baseStyle.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Color(0xff122644),
      );

  static TextStyle get bundleValidityValue => _baseStyle.copyWith(
        fontSize: 10,
        fontWeight: FontWeight.w700,
        color: Color(0xff122644),
      );

  static TextStyle get bundlePrice => _baseStyle.copyWith(
      fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xff329CFB));

  static TextStyle get bundlePriceSelected => _baseStyle.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: AppColors.selectedPriceRed,
      );

  // --- Filter Chip ---
  static TextStyle get filterChipSelected => _baseStyle.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: AppColors.textWhite,
      );

  static TextStyle get filterChipUnselected => _baseStyle.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Color(0xff4CA8FB),
      );

  // --- Cart ---
  static TextStyle get cartPrice => _baseStyle.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        color: Color(0xff329CFB),
      );

  static TextStyle get cartDescription => _baseStyle.copyWith(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: Color(0xff667085),
      );

  static TextStyle get cartQuantity => _baseStyle.copyWith(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      );

  static TextStyle get checkoutButtonText => _baseStyle.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: AppColors.textWhite,
      );

  // --- Regional Plans ---
  static TextStyle get regionalPlanName => _baseStyle.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: Color(0xff122644),
      );

  static TextStyle get regionalPlanDetail => _baseStyle.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
      );

  static TextStyle get regionalPlanCountries => _baseStyle.copyWith(
        fontSize: 13,
        fontWeight: FontWeight.w700,
        color: Color(0xff122644),
      );

  static TextStyle get regionalPlanPrice => _baseStyle.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: Color(0xff329CFB),
      );

  // --- Search ---
  static TextStyle get searchHint => _baseStyle.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
      );

  // --- Country chip ---
  static TextStyle get countryChipText => _baseStyle.copyWith(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: AppColors.textPrimary,
      );

  // --- Support ---
  static TextStyle get supportTitle => _baseStyle.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
      );

  static TextStyle get supportSubtitle => _baseStyle.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
      );
}
