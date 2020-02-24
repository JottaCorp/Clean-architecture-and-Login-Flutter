import 'package:login_clean_architecture/core/network/network_info.dart';
import 'package:login_clean_architecture/features/login/data/datasource/login_data_source.dart';
import 'package:login_clean_architecture/features/login/data/repositories/login_repository_impl.dart';
import 'package:login_clean_architecture/features/login/domain/repositories/login_repository.dart';
import 'package:login_clean_architecture/features/login/domain/usecases/get_login_token.dart';
import 'package:login_clean_architecture/features/login/presentation/bloc/login_bloc.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Number Trivia
  // Bloc
  sl.registerFactory(
    () => LoginBloc(
      glToken: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetLoginToken(sl()));

  // Repository
  sl.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(
      loginDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<LoginDataSource>(
    () => LoginDataSourceImpl(client: sl()),
  );

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}