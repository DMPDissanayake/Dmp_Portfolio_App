import 'package:dmpportfolioapp/features/about/data/datasources/profile_remote_datasource.dart';
import 'package:dmpportfolioapp/features/about/data/repository/prfile_repository_impl.dart';
import 'package:dmpportfolioapp/features/about/domain/repository/profile_repository.dart';
import 'package:dmpportfolioapp/features/about/domain/usercase/get_profile_usercase.dart';
import 'package:dmpportfolioapp/features/about/presentation/bloc/about_bloc.dart';
import 'package:dmpportfolioapp/features/education/data/datasources/education_remote_datasource.dart';
import 'package:dmpportfolioapp/features/education/data/repositories/education_repository_impl.dart';
import 'package:dmpportfolioapp/features/education/domain/repositories/education_repository.dart';
import 'package:dmpportfolioapp/features/education/domain/usecases/get_education_usecase.dart';
import 'package:dmpportfolioapp/features/education/presentation/bloc/edaduation_bloc.dart';
import 'package:dmpportfolioapp/features/projects/data/datasources/project_remote_datasource.dart';
import 'package:dmpportfolioapp/features/projects/data/repositories/project_reposotory_impl.dart';
import 'package:dmpportfolioapp/features/projects/domain/repository/project_reposotory.dart';
import 'package:dmpportfolioapp/features/projects/domain/usecases/get_projects_usecase.dart';
import 'package:dmpportfolioapp/features/projects/presentation/bloc/project_bloc.dart';
import 'package:dmpportfolioapp/features/skils/data/datasources/skills_remote_datasource.dart';
import 'package:dmpportfolioapp/features/skils/domain/usecases/get_experiences_usecase.dart';
import 'package:dmpportfolioapp/features/skils/data/repositories/skills_repository_impl.dart';
import 'package:dmpportfolioapp/features/skils/domain/repositories/skils_repository.dart';
import 'package:dmpportfolioapp/features/skils/domain/usecases/get_skils_usecase.dart';
import 'package:dmpportfolioapp/features/skils/presentation/bloc/skils_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // External
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

  // Features - Education
  sl.registerLazySingleton<EducationRemoteDataSource>(
    () => EducationRemoteDataSourceImpl(firestore: sl()),
  );
  sl.registerLazySingleton<EducationRepository>(
    () => EducationRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton(() => GetEducationUseCase(repository: sl()));
  sl.registerFactory(() => EducationBloc(getEducationUseCase: sl()));

  // Features - Skills Injection
  sl.registerLazySingleton<SkilsRemoteDataSource>(
    () => SkilsRemoteDataSourceImpl(firestore: sl()),
  );
  sl.registerLazySingleton<SkilsRepository>(
    () => SkilsRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton(() => GetSkilsUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetExperiencesUseCase(sl()));

  sl.registerFactory(
    () => SkilsBloc(getSkilsUseCase: sl(), getExperiencesUseCase: sl()),
  );

  // Features - EducaProjecttion
  sl.registerLazySingleton<ProjectRemoteDataSource>(
    () => ProjectRemoteDataSourceImpl(firestore: sl()),
  );
  sl.registerLazySingleton<ProjectRepository>(
    () => ProjectRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton(() => GetProjectsUseCase(sl()));
  sl.registerFactory(() => ProjectBloc(getProjectsUseCase: sl()));

  // Features - Profile
  sl.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(firestore: sl()),
  );
  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton(() => GetProfileUseCase(repository: sl()));
  sl.registerFactory(() => ProfileBloc(getProfileUseCase: sl()));
}
