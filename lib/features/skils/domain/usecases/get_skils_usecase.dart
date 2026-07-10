import '../entities/skil_entity.dart';
import '../repositories/skils_repository.dart';

class GetSkilsUseCase {
  final SkilsRepository repository;

  GetSkilsUseCase({required this.repository});

  Future<List<SkilEntity>> call() async {
    return await repository.getSkilsData();
  }
}
