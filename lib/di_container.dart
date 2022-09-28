import 'package:get_it/get_it.dart';
import 'package:photo_grid_flutter/data/api_service_impl.dart';
import 'package:photo_grid_flutter/domain/services/api_service.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // External
  // final sharedPreferences = await SharedPreferences.getInstance();
  // sl.registerLazySingleton(() => sharedPreferences);

  //repositories
  sl.registerLazySingleton<ApiService>(() => ApiServiceImpl());
}
