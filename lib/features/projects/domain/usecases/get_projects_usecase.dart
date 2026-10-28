// domain/usecases/get_projects_usecase.dart
import 'package:dmpportfolioapp/features/projects/domain/repository/project_reposotory.dart';

import '../entities/project_entity.dart';

class GetProjectsUseCase {
  final ProjectRepository repository;

  GetProjectsUseCase(this.repository);

  Future<List<ProjectEntity>> call() async {
    return await repository.getProjectData();
  }
}
