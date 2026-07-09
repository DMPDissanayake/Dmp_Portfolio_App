import 'package:dmpportfolioapp/features/education/data/datasources/education_remote_datasource.dart';
import 'package:dmpportfolioapp/features/education/data/repositories/education_repository_impl.dart';
import 'package:dmpportfolioapp/features/education/domain/repositories/education_repository.dart';
import 'package:dmpportfolioapp/features/education/domain/usecases/get_education_usecase.dart';
import 'package:dmpportfolioapp/features/education/presentation/bloc/edaduation_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // External
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

  // Features - Education
  // 1. Data Source
  sl.registerLazySingleton<EducationRemoteDataSource>(
    () => EducationRemoteDataSourceImpl(firestore: sl()),
  );

  // 2. Repository
  sl.registerLazySingleton<EducationRepository>(
    () => EducationRepositoryImpl(remoteDataSource: sl()),
  );

  // 3. Use Case
  sl.registerLazySingleton(() => GetEducationUseCase(repository: sl()));

  // 4. Bloc
  sl.registerFactory(() => EducationBloc(getEducationUseCase: sl()));
}
