import 'package:get_it/get_it.dart';
import '../network/dio_service/dio_provider.dart';
import '../network/dio_service/dio_service.dart';
import '../network/dio_service/dio_service_impl.dart';
import '../shared_preferences/preference_helper.dart';
import '../shared_preferences/preferences_provider.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc

  // sl.registerFactory(() => LoginCubit(loginUseCase: sl()));

  // UseCases

  // sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(sl()));

  // Repository

  // sl.registerLazySingleton<AuthRepository>(
  //   () => AuthRepositoryImpl(authDataSource: sl(), preferenceHelper: sl()),
  // );
  
  // Datasources

  // sl.registerFactory<AuthDataSource>(
  //   () => AuthDataSourceImpl(dioService: sl()),
  // );

  //! External

  sl.registerLazySingleton<DioService>(() => DioServiceImpl(dioProvider: sl()));
  sl.registerLazySingleton<DioProvider>(() => DioProvider.instance);
  sl.registerLazySingleton(() => SharedPreferencesProvider.instance);
  sl.registerLazySingleton<PreferenceHelper>(
    () => PreferenceHelper(preferencesProvider: sl()),
  );
}
