import 'package:dmpportfolioapp/features/skils/domain/usecases/get_experiences_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_skils_usecase.dart';
import 'skils_event.dart';
import 'skils_state.dart';

class SkilsBloc extends Bloc<SkilsEvent, SkilsState> {
  final GetSkilsUseCase getSkilsUseCase;
  final GetExperiencesUseCase getExperiencesUseCase;

  SkilsBloc({
    required this.getSkilsUseCase,
    required this.getExperiencesUseCase,
  }) : super(SkilsInitial()) {
    //Skils
    on<FetchSkilsData>((event, emit) async {
      emit(SkilsLoading());
      try {
        final data = await getSkilsUseCase();
        emit(SkilsLoaded(skilsList: data));
      } catch (e) {
        emit(SkilsError(message: e.toString()));
      }
    });

    //Experience
    on<FetchExperienceData>((event, emit) async {
      emit(SkilsLoading());
      try {
        final data = await getExperiencesUseCase();
        emit(ExperienceLoaded(experienceList: data));
      } catch (e) {
        emit(SkilsError(message: e.toString()));
      }
    });
  }
}
