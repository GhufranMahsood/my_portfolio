import 'package:flutter/material.dart';

class TechCategoryModel {
  final String title;
  final List<SkillItem> skills;

  const TechCategoryModel({
    required this.title,
    required this.skills,
  });
}

class SkillItem {
  final String name;
  final dynamic icon;
  final Color? color;

  const SkillItem({
    required this.name,
    this.icon,
    this.color,
  });
}
