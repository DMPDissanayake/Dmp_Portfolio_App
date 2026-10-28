import 'package:dmpportfolioapp/features/projects/domain/entities/project_entity.dart';

abstract class ProjectState {
  const ProjectState();
}

class ProjectInitial extends ProjectState {}

class ProjectLoading extends ProjectState {}

class ProjectError extends ProjectState {
  final String message;

  const ProjectError({required this.message});
}

class ProjectLoaded extends ProjectState {
  final List<ProjectEntity> projectList;

  const ProjectLoaded({required this.projectList});
}
