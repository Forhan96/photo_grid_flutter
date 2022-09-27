import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // External
  // final sharedPreferences = await SharedPreferences.getInstance();
  // sl.registerLazySingleton(() => sharedPreferences);

  //repositories
  sl.registerLazySingleton(() => CommonRepository());
}
