import '../entities/education_entity.dart';
import '../repositories/education_repository.dart';

class GetEducationUseCase {
  final EducationRepository repository;

  GetEducationUseCase({required this.repository});

  Future<List<EducationEntity>> call() async {
    return await repository.getEducationData();
  }
}
