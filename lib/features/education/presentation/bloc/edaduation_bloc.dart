import 'package:dmpportfolioapp/features/education/presentation/bloc/edaduation_event.dart';
import 'package:dmpportfolioapp/features/education/presentation/bloc/edaduation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_education_usecase.dart';

class EducationBloc extends Bloc<EducationEvent, EducationState> {
  final GetEducationUseCase getEducationUseCase;

  EducationBloc({required this.getEducationUseCase})
    : super(EducationInitial()) {
    on<FetchEducationData>((event, emit) async {
      emit(EducationLoading());
      try {
        final data = await getEducationUseCase();
        emit(EducationLoaded(educationList: data));
      } catch (e) {
        emit(EducationError(message: e.toString()));
      }
    });
  }
}
