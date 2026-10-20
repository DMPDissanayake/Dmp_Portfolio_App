import 'package:dmpportfolioapp/features/skils/domain/entities/experience_entity.dart';

import '../../domain/entities/skil_entity.dart';

abstract class SkilsState {
  const SkilsState();
}

class SkilsInitial extends SkilsState {}

class SkilsLoading extends SkilsState {}

class SkilsError extends SkilsState {
  final String message;

  const SkilsError({required this.message});
}

class SkilsLoaded extends SkilsState {
  final List<SkilEntity> skilsList;

  const SkilsLoaded({required this.skilsList});
}

class ExperienceLoaded extends SkilsState {
  final List<ExperienceEntity> experienceList;

  const ExperienceLoaded({required this.experienceList});
}
