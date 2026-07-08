import 'package:flutter/material.dart';

class ExperienceItem {
  final IconData icon;
  final String role;
  final String company;
  final String duration;
  final String? statusTag; // e.g., "Current" (Optional)
  final List<String> highlights;
  final List<String> skills;

  ExperienceItem({
    required this.icon,
    required this.role,
    required this.company,
    required this.duration,
    this.statusTag,
    required this.highlights,
    required this.skills,
  });
}
