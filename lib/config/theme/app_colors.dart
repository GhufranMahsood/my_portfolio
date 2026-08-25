import 'package:flutter/material.dart';

/// Design System Color Palette for Smart Habit Tracker
class AppColors {
  AppColors._();

  // Primary Brand Colors (Purple)
  static const Color primary = Color(0xFF9333EA); // Vibrant Purple
  static const Color primaryLight = Color(0xFFA855F7);
  static const Color primaryDark = Color(0xFF7E22CE);
  static const Color primaryContainer = Color(0xFFF3E8FF);
  static const Color primaryContainerDark = Color(0xFF3B0764);

  // Secondary & Accent Colors
  static const Color secondary = Color(0xFFE2E8F0);
  static const Color secondaryDark = Color(0xFF1E293B);
  static const Color accent = Color(0xFFF472B6);
  static const Color gold = Color(0xFFFBBF24);
  static const Color orange = Color(0xFFF97316);
  static const Color yellow = Color(0xFFFBBF24);
  static const Color blue = Color(0xFF3B82F6);

  // Semantic / Status Colors
  static const Color success = Color(0xFF10B981);
  static const Color green = Color(0xFF10B981);
  static const Color lightGreen = Color(0xFF34D399);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color red = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);

  // Light Neutral Palette
  static const Color white = Color(0xFFFFFFFF);
  static const Color lightBackground = Color(0xFFF9FAFB); // Very light grey for background
  static const Color lightSurface = Color(0xFFFFFFFF); // White for cards/surface
  static const Color lightSurfaceSecondary = Color(0xFFF3F4F6); 
  static const Color lightBorder = Color(0xFFE5E7EB);
  static const Color grey = Color(0xFFE5E7EB);
  static const Color lightGrey = Color(0xFFF3F4F6);
  static const Color textPrimaryLight = Color(0xFF111827); // Very dark grey/black
  static const Color textSecondaryLight = Color(0xFF6B7280); // Medium grey

  // Dark Neutral Palette
  static const Color black = Color(0xFF000000);
  static const Color darkBackground = Color(0xFF09090B); // Very dark for background
  static const Color darkSurface = Color(0xFF18181B); // Slightly lighter for cards
  static const Color darkSurfaceSecondary = Color(0xFF27272A);
  static const Color darkBorder = Color(0xFF27272A);
  static const Color darkGrey = Color(0xFF71717A);
  static const Color textPrimaryDark = Color(0xFFFAFAFA); // White/Very light grey
  static const Color textSecondaryDark = Color(0xFFA1A1AA); // Medium grey

  // Utility Colors
  static const Color transparent = Color(0x00000000);
  static const Color overlay = Color(0x80000000);

  // Habit Specific Colors (from HabitKit screenshot)
  static const List<Color> habitColors = [
    Color(0xFFEF4444), // Red
    Color(0xFFF97316), // Orange
    Color(0xFFF59E0B), // Amber
    Color(0xFFEAB308), // Yellow
    Color(0xFF84CC16), // Lime
    Color(0xFF22C55E), // Green
    Color(0xFF10B981), // Emerald
    Color(0xFF14B8A6), // Teal
    Color(0xFF06B6D4), // Cyan
    Color(0xFF0EA5E9), // Light Blue
    Color(0xFF3B82F6), // Blue
    Color(0xFF6366F1), // Indigo
    Color(0xFF8B5CF6), // Violet
    Color(0xFFA855F7), // Purple
    Color(0xFFD946EF), // Fuchsia
    Color(0xFFEC4899), // Pink
    Color(0xFFF43F5E), // Rose
    Color(0xFF64748B), // Slate
    Color(0xFF71717A), // Zinc
    Color(0xFF78716C), // Stone
  ];
}
