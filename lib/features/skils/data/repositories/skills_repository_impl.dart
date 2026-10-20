import 'package:dmpportfolioapp/features/skils/data/datasources/skills_remote_datasource.dart';
import 'package:dmpportfolioapp/features/skils/domain/entities/experience_entity.dart';

import '../../domain/entities/skil_entity.dart';
import '../../domain/repositories/skils_repository.dart';

class SkilsRepositoryImpl implements SkilsRepository {
  final SkilsRemoteDataSource remoteDataSource;

  SkilsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<SkilEntity>> getSkilsData() async {
    return await remoteDataSource.getSkilsFromFirestore();
  }

  @override
  Future<List<ExperienceEntity>> getExperiences() async {
    return await remoteDataSource.getExperienceFromFirestore();
  }
}
