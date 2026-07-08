import 'package:flutter/material.dart';

class ProjectModel {
  final String title;
  final String category;
  final String description;
  final List<String> bulletPoints;
  final List<String> techStack;
  final VoidCallback? onViewLive;
  final VoidCallback? onAppStore;

  ProjectModel({
    required this.title,
    required this.category,
    required this.description,
    required this.bulletPoints,
    required this.techStack,
    this.onViewLive,
    this.onAppStore,
  });
}
