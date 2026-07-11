import 'package:dmpportfolioapp/features/projects/domain/usecases/get_projects_usecase.dart';
import 'package:dmpportfolioapp/features/projects/presentation/bloc/project_event.dart';
import 'package:dmpportfolioapp/features/projects/presentation/bloc/project_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  final GetProjectsUseCase getProjectsUseCase;

  ProjectBloc({required this.getProjectsUseCase}) : super(ProjectInitial()) {
    on<FetchProjectData>((event, emit) async {
      emit(ProjectLoading());
      try {
        final data = await getProjectsUseCase();
        emit(ProjectLoaded(projectList: data));
      } catch (e) {
        emit(ProjectError(message: e.toString()));
      }
    });
  }
}
