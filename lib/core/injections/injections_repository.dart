part of 'injections.dart';

void injectRepository() {
  getIt.registerLazySingleton<BaseRepository>(
    () => BaseRepositoryImpl(
      getIt(),
      getIt(),
    ),
  );
  getIt.registerLazySingleton<SubscribeRepository>(
    () => SubscribeRepositoryImpl(
      source: getIt(),
      local: getIt(),
    ),
  );
}
