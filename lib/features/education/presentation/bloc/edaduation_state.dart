import '../../domain/entities/education_entity.dart';

abstract class EducationState {
  const EducationState();
}

class EducationInitial extends EducationState {}

class EducationLoading extends EducationState {}

class EducationLoaded extends EducationState {
  final List<EducationEntity> educationList;

  const EducationLoaded({required this.educationList});
}

class EducationError extends EducationState {
  final String message;

  const EducationError({required this.message});
}
