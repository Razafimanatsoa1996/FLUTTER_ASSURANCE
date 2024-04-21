part of 'injections.dart';

Future<void> injectDataSource(String baseUrl) async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  getIt.registerSingleton(preferences);

  getIt.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(
      baseUrl: baseUrl,
      dio: Dio(),
    ),
  );

  getIt.registerLazySingleton<SubscribeLocalDataSource>(
    () => SubscribeLocalDataSourceImpl(
      getIt(),
    ),
  );

  getIt.registerLazySingleton<SubscribeRemoteDataSource>(
    () => SubscribeRemoteDataSourceImpl(
      getIt(),
    ),
  );
  
}
