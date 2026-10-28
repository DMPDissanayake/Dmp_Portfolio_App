// data/models/project_model.dart
import '../../domain/entities/project_entity.dart';

class ProjectModel extends ProjectEntity {
  const ProjectModel({
    required super.title,
    required super.subtitle,
    required super.tag,
    required super.responsibilities,
    required super.technologies,
    super.githubLink,
    super.liveLink,
    required super.category,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> map) {
    return ProjectModel(
      title: map['title'] ?? '',
      subtitle: map['subtitle'] ?? '',
      tag: map['tag'] ?? '',
      responsibilities: List<String>.from(map['responsibilities'] ?? []),
      technologies: List<String>.from(map['technologies'] ?? []),
      githubLink: map['github_link'],
      liveLink: map['live_link'],
      category: map['category'] ?? 'organization',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'subtitle': subtitle,
      'tag': tag,
      'responsibilities': responsibilities,
      'technologies': technologies,
      'github_link': githubLink,
      'live_link': liveLink,
      'category': category,
    };
  }
}
