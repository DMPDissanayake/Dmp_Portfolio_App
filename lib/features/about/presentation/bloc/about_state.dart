import 'package:dmpportfolioapp/features/about/domain/entity/profile_entity.dart';

abstract class ProfileState {
  const ProfileState();
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final ProfileEntity data;

  const ProfileLoaded({required this.data});
}

class ProfileError extends ProfileState {
  final String message;

  const ProfileError({required this.message});
}
