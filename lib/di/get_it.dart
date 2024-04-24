import 'package:film_fusion/controller/movies_cubit.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void init() {

  getIt.registerLazySingleton<MoviesCubit>(
        () => MoviesCubit(),
  );
}