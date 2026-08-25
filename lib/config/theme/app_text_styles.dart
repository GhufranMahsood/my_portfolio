import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// Clean typography design system using Google Fonts (Poppins & Fira Code)
class AppTextStyles {
  AppTextStyles._();

  static TextStyle get heroTitle => GoogleFonts.poppins(
        fontSize: 52,
        fontWeight: FontWeight.w700,
        color: AppColors.textWhite,
        height: 1.15,
        letterSpacing: -0.5,
      );

  static TextStyle get heroSubtitle => GoogleFonts.poppins(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        color: AppColors.textLight,
      );

  static TextStyle get sectionTitle => GoogleFonts.poppins(
        fontSize: 36,
        fontWeight: FontWeight.w700,
        color: AppColors.textWhite,
        letterSpacing: -0.5,
      );

  static TextStyle get sectionSubtitle => GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.textMuted,
        height: 1.6,
      );

  static TextStyle get sectionTag => GoogleFonts.firaCode(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.primary,
        letterSpacing: 1.2,
      );

  static TextStyle get quoteText => GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic,
        color: AppColors.textMuted,
        height: 1.6,
      );

  static TextStyle get cardTitle => GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.textWhite,
      );

  static TextStyle get cardSubtitle => GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.primary,
      );

  static TextStyle get bodyText => GoogleFonts.poppins(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: AppColors.textLight,
        height: 1.7,
      );

  static TextStyle get bodySmall => GoogleFonts.poppins(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: AppColors.textMuted,
        height: 1.6,
      );

  static TextStyle get statNumber => GoogleFonts.poppins(
        fontSize: 38,
        fontWeight: FontWeight.w800,
        color: AppColors.textWhite,
      );

  static TextStyle get statLabel => GoogleFonts.poppins(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: AppColors.textMuted,
        height: 1.3,
      );

  static TextStyle get buttonText => GoogleFonts.poppins(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: AppColors.white,
        letterSpacing: 0.5,
      );

  static TextStyle get codeBadge => GoogleFonts.firaCode(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: AppColors.textLight,
      );

  static TextStyle get navItem => GoogleFonts.poppins(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: AppColors.textLight,
      );

  static TextTheme getTextTheme({required Color textColor}) {
    return TextTheme(
      displayLarge: GoogleFonts.poppins(
        fontSize: 52,
        fontWeight: FontWeight.w700,
        color: textColor,
      ),
      headlineLarge: GoogleFonts.poppins(
        fontSize: 36,
        fontWeight: FontWeight.w700,
        color: textColor,
      ),
      headlineMedium: GoogleFonts.poppins(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: textColor,
      ),
      titleLarge: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: textColor,
      ),
      bodyLarge: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: textColor,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: textColor,
      ),
    );
  }
}
