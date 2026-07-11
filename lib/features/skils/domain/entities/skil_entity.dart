import 'package:equatable/equatable.dart';

class SkilEntity extends Equatable {
  final String title;
  final String
  category; // 'technical', 'professional', 'achievement', 'learning'
  final int?
  iconPath; // SVG path එකක් හෝ icon code එකක් (String එකක් විදිහට තියාගන්න එක Firestore වලට ලේසියි)

  // 1. Technical and Professional
  final List<String>? items;

  // 2. Achievements
  final Map<String, dynamic>? metrics; // {'years': 2, 'projects': 10, ...}
  final List<MilestoneItemEntity>? milestones; // Strongly typed milestone list

  // 3. Learning
  final CurrentlyMasteringEntity? currentlyMastering;
  final List<LearningRoadmapEntity>? learningRoadmap;

  const SkilEntity({
    required this.title,
    required this.category,
    this.iconPath,
    this.items,
    this.metrics,
    this.milestones,
    this.currentlyMastering,
    this.learningRoadmap,
  });

  @override
  List<Object?> get props => [
    title,
    category,
    iconPath,
    items,
    metrics,
    milestones,
    currentlyMastering,
    learningRoadmap,
  ];
}

// 💡 Learning Roadmap
class LearningRoadmapEntity extends Equatable {
  final String title;
  final String subtitle;
  final String status;
  final double progress; // 0.0 - 1.0
  final String iconType; // 'speed', 'rocket', 'testing'

  const LearningRoadmapEntity({
    required this.title,
    required this.subtitle,
    required this.status,
    required this.progress,
    required this.iconType,
  });

  @override
  List<Object?> get props => [title, subtitle, status, progress, iconType];
}

// 💡 Currently Mastering
class CurrentlyMasteringEntity extends Equatable {
  final String title;
  final String subtitle;

  const CurrentlyMasteringEntity({required this.title, required this.subtitle});

  @override
  List<Object?> get props => [title, subtitle];
}

// 💡 Milestone
class MilestoneItemEntity extends Equatable {
  final List<String> years;
  final String description;

  const MilestoneItemEntity({required this.years, required this.description});

  @override
  List<Object?> get props => [years, description];
}
