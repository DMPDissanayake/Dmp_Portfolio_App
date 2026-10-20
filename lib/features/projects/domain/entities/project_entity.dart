// domain/entities/project_entity.dart
import 'package:equatable/equatable.dart';

class ProjectEntity extends Equatable {
  final String title;
  final String subtitle;
  final String tag;
  final List<String> responsibilities;
  final List<String> technologies;
  final String? githubLink;
  final String? liveLink;
  final String category;

  const ProjectEntity({
    required this.title,
    required this.subtitle,
    required this.tag,
    required this.responsibilities,
    required this.technologies,
    this.githubLink,
    this.liveLink,
    required this.category,
  });

  @override
  List<Object?> get props => [
    title,
    subtitle,
    tag,
    responsibilities,
    technologies,
    githubLink,
    liveLink,
    category,
  ];
}
