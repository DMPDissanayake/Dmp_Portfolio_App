// domain/usecases/get_experiences_usecase.dart
import 'package:dmpportfolioapp/features/skils/domain/repositories/skils_repository.dart';

import '../entities/experience_entity.dart';

class GetExperiencesUseCase {
  final SkilsRepository repository;

  GetExperiencesUseCase(this.repository);

  Future<List<ExperienceEntity>> call() async {
    return await repository.getExperiences();
  }
}
