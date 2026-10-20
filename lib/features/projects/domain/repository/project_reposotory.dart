import 'package:dmpportfolioapp/features/projects/domain/entities/project_entity.dart';

abstract class ProjectRepository {
  Future<List<ProjectEntity>> getProjectData();
}
