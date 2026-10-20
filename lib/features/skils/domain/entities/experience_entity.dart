import 'package:equatable/equatable.dart';

class ExperienceEntity extends Equatable {
  final String role;
  final String company;
  final String duration;
  final bool isCurrent;
  final List<String> responsibilities;
  final List<String> technologies;

  const ExperienceEntity({
    required this.role,
    required this.company,
    required this.duration,
    required this.isCurrent,
    required this.responsibilities,
    required this.technologies,
  });

  @override
  List<Object?> get props => [
    role,
    company,
    duration,
    isCurrent,
    responsibilities,
    technologies,
  ];
}
