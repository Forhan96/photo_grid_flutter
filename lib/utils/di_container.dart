import 'package:get_it/get_it.dart';
import 'package:photo_grid_flutter/data/api_service_impl.dart';
import 'package:photo_grid_flutter/domain/providers/photo_provider.dart';
import 'package:photo_grid_flutter/domain/services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  //repositories
  sl.registerLazySingleton<ApiService>(() => ApiServiceImpl());

  //providers
  sl.registerFactory(() => PhotoProvider(sharedPreferences: sl(), apiService: sl()));
}
