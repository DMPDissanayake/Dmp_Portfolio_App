import 'package:dmpportfolioapp/features/about/domain/entity/profile_entity.dart';
import 'package:dmpportfolioapp/features/about/domain/repository/profile_repository.dart';

class GetProfileUseCase {
  final ProfileRepository repository;

  GetProfileUseCase({required this.repository});

  Future<List<ProfileEntity>> call() async {
    return await repository.getProfileData();
  }
}
