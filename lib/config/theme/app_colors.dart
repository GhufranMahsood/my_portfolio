import 'package:flutter/material.dart';

/// Design System Color Palette - Electric Sky Blue (#21BCFF) & Deep Obsidian Theme
class AppColors {
  AppColors._();

  // Primary Dark Background Palette (Deep Obsidian Midnight Navy)
  static const Color darkBackground = Color(0xFF070B12); // Deep obsidian background
  static const Color darkCard = Color(0xFF101726); // Midnight slate card surface
  static const Color darkCardSecondary = Color(0xFF182238); // Elevated card layer
  static const Color darkBorder = Color(0xFF1E2D4A); // Slate-navy border
  static const Color darkBorderLight = Color(0x3321BCFF); // Soft cyan border glow

  // Primary Brand Accents (#21BCFF - Electric Sky Cyan)
  static const Color primary = Color(0xFF21BCFF); // Vibrant Electric Sky Blue
  static const Color primaryLight = Color(0xFF67D4FF); // Soft Aqua / Ice Blue
  static const Color primaryDark = Color(0xFF009EE0); // Deep Azure / Ocean Blue
  static const Color primaryAccentGlow = Color(0x3321BCFF); // Cyan glow

  // Secondary & Highlight Accents
  static const Color secondary = Color(0xFF00E5FF); // Neon Aqua
  static const Color secondaryLight = Color(0xFF80F0FF);
  static const Color cyanAccent = Color(0xFF21BCFF);
  static const Color purpleAccent = Color(0xFFA855F7);

  // Neutral Text Colors
  static const Color textWhite = Color(0xFFF8FAFC); // High emphasis
  static const Color textLight = Color(0xFFCBD5E1); // Medium-high emphasis
  static const Color textMuted = Color(0xFF94A3B8); // Medium-low emphasis
  static const Color textDim = Color(0xFF64748B); // Low emphasis

  // Status & Badges
  static const Color badgeBg = Color(0x1F21BCFF); // 12% #21BCFF
  static const Color badgeBorder = Color(0xFF21BCFF);
  static const Color badgeText = Color(0xFF67D4FF);

  static const Color openSourceBadgeBg = Color(0x2621BCFF);
  static const Color openSourceBadgeText = Color(0xFF21BCFF);
  static const Color productBadgeBg = Color(0x26A855F7);
  static const Color productBadgeText = Color(0xFFA855F7);

  // Tech Category Colors
  static const Color techMobile = Color(0xFF02569B);
  static const Color techWeb = Color(0xFFE44D26);
  static const Color techServer = Color(0xFF339933);
  static const Color techDb = Color(0xFFF29111);
  static const Color techVcs = Color(0xFFF05032);
  static const Color techDesign = Color(0xFFF24E1E);

  // Common UI Colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color transparent = Colors.transparent;
  static const Color error = Color(0xFFEF4444);
  static const Color success = Color(0xFF10B981);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF21BCFF), Color(0xFF009EE0)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient accentGradient = LinearGradient(
    colors: [Color(0xFF67D4FF), Color(0xFF21BCFF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const RadialGradient heroGlowGradient = RadialGradient(
    colors: [Color(0x3321BCFF), Colors.transparent],
    radius: 0.8,
  );

  static const LinearGradient cardGradient = LinearGradient(
    colors: [Color(0xFF101726), Color(0xFF070B12)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
