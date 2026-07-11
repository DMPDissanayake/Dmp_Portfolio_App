import 'package:dmpportfolioapp/features/projects/data/datasources/project_remote_datasource.dart';
import 'package:dmpportfolioapp/features/projects/domain/entities/project_entity.dart';
import 'package:dmpportfolioapp/features/projects/domain/repository/project_reposotory.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final ProjectRemoteDataSource remoteDataSource;

  ProjectRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<ProjectEntity>> getProjectData() async {
    return await remoteDataSource.getProjectData();
  }
}
