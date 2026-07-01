import 'dart:ui';

class ProjectEntity {
  final String id;
  final String title;
  final String shortDescription;
  final String fullDescription;
  final String thumbnail;
  final String images;
  final List<String> technologies;
  final String githubUrl;
  final String liveDemoUrl;
  final bool isFeatured;
  final bool isCompleted;
  final String duration;
  final String icon;
  final Color color;

  const ProjectEntity({
    required this.id,
    required this.title,
    required this.shortDescription,
    required this.fullDescription,
    required this.thumbnail,
    required this.images,
    required this.technologies,
    required this.githubUrl,
    required this.liveDemoUrl,
    required this.isFeatured,
    required this.isCompleted,
    required this.duration,
    required this.icon,
    required this.color,
  });
}
