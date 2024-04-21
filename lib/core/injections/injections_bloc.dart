part of 'injections.dart';

void injectBloc() {
  getIt.registerFactory<SplashBloc>(
    () => SplashBloc(),
  );
  getIt.registerFactory<SubscribeBloc>(
    () => SubscribeBloc(
      getIt(),
      getIt(),
    ),
  );
}
