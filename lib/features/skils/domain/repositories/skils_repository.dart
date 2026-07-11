import 'package:dmpportfolioapp/features/skils/domain/entities/experience_entity.dart';

import '../entities/skil_entity.dart';

abstract class SkilsRepository {
  Future<List<SkilEntity>> getSkilsData();
  Future<List<ExperienceEntity>> getExperiences();
}
