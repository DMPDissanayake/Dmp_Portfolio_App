import 'package:dmpportfolioapp/features/about/data/datasources/profile_remote_datasource.dart';
import 'package:dmpportfolioapp/features/about/domain/entity/profile_entity.dart';
import 'package:dmpportfolioapp/features/about/domain/repository/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;

  ProfileRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<ProfileEntity>> getProfileData() async {
    return await remoteDataSource.getProfileQualifications();
  }
}
