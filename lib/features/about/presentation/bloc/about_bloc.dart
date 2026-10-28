import 'package:dmpportfolioapp/features/about/domain/usercase/get_profile_usercase.dart';
import 'package:dmpportfolioapp/features/about/presentation/bloc/about_event.dart';
import 'package:dmpportfolioapp/features/about/presentation/bloc/about_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfileUseCase getProfileUseCase;

  ProfileBloc({required this.getProfileUseCase}) : super(ProfileInitial()) {
    on<FetchProfileData>((event, emit) async {
      emit(ProfileLoading());
      try {
        final data = await getProfileUseCase();
        emit(ProfileLoaded(data: data.first));
      } catch (e) {
        emit(ProfileError(message: e.toString()));
      }
    });
  }
}
