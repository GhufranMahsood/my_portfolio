import 'package:flutter/material.dart';

class CommunityModel {
  final String title;
  final String role;
  final String duration;
  final String description;
  final dynamic icon;
  final Color brandColor;

  const CommunityModel({
    required this.title,
    required this.role,
    required this.duration,
    required this.description,
    required this.icon,
    required this.brandColor,
  });
}
