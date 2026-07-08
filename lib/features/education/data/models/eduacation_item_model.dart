import 'package:flutter/material.dart';

class EduacationItemModel {
  final String title;
  final String institution;
  final String dateRange;
  final List<String> bulletPoints;
  final IconData icon;

  // Optional field for special callouts like Research Publications
  final String? highlightBoxText;

  EduacationItemModel({
    required this.title,
    required this.institution,
    required this.dateRange,
    required this.bulletPoints,
    required this.icon,
    this.highlightBoxText,
  });
}
