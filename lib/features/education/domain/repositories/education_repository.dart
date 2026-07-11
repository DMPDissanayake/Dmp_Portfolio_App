import 'package:dmpportfolioapp/features/education/domain/entities/education_entity.dart';

abstract class EducationRepository {
  Future<List<EducationEntity>> getEducationData();
}
