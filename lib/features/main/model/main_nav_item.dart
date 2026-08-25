import 'package:flutter/material.dart';
import 'package:my_portfolio/config/utils/enum.dart';

class MainNavItem {
  final String title;
  final SectionType section;
  final IconData icon;

  const MainNavItem({
    required this.title,
    required this.section,
    required this.icon,
  });
}
