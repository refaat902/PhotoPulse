import 'package:get_it/get_it.dart';
import 'package:photopulse/features/main/data/data_source/search_data_source.dart';
import 'package:photopulse/features/main/data/data_source/search_data_source_impl.dart';
import 'package:photopulse/features/main/data/repository/search_repository_impl.dart';
import 'package:photopulse/features/main/domain/repository/search_repository.dart';
import 'package:photopulse/features/main/domain/use_cases/search_use_case.dart';
import 'package:photopulse/features/main/presentation/cubits/search/search_cubit.dart';
import '../network/dio_service/dio_provider.dart';
import '../network/dio_service/dio_service.dart';
import '../network/dio_service/dio_service_impl.dart';
import '../shared_preferences/preference_helper.dart';
import '../shared_preferences/preferences_provider.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc

  sl.registerFactory(() => SearchCubit(searchUseCase: sl()));

  // UseCases

  sl.registerLazySingleton<SearchUseCase>(() => SearchUseCase(sl()));

  // Repository

  sl.registerLazySingleton<SearchRepository>(
    () => SearchRepositoryImpl(searchDataSource: sl(), preferenceHelper: sl()),
  );
  
  // Datasources

  sl.registerFactory<SearchDataSource>(
    () => SearchDataSourceImpl(dioService: sl()),
  );

  //! External

  sl.registerLazySingleton<DioService>(() => DioServiceImpl(dioProvider: sl()));
  sl.registerLazySingleton<DioProvider>(() => DioProvider.instance);
  sl.registerLazySingleton(() => SharedPreferencesProvider.instance);
  sl.registerLazySingleton<PreferenceHelper>(
    () => PreferenceHelper(preferencesProvider: sl()),
  );
}
