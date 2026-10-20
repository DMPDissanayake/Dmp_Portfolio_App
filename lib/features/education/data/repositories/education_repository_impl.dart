import '../../domain/entities/education_entity.dart';
import '../../domain/repositories/education_repository.dart';
import '../datasources/education_remote_datasource.dart';

class EducationRepositoryImpl implements EducationRepository {
  final EducationRemoteDataSource remoteDataSource;

  EducationRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<EducationEntity>> getEducationData() async {
    return await remoteDataSource.getEducationQualifications();
  }
}
