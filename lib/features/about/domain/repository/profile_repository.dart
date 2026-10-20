import 'package:dmpportfolioapp/features/about/domain/entity/profile_entity.dart';

abstract class ProfileRepository {
  Future<List<ProfileEntity>> getProfileData();
}
