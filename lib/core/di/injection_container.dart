import 'package:dmpportfolioapp/features/education/data/datasources/education_remote_datasource.dart';
import 'package:dmpportfolioapp/features/education/data/repositories/education_repository_impl.dart';
import 'package:dmpportfolioapp/features/education/domain/repositories/education_repository.dart';
import 'package:dmpportfolioapp/features/education/domain/usecases/get_education_usecase.dart';
import 'package:dmpportfolioapp/features/education/presentation/bloc/edaduation_bloc.dart';
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
}
