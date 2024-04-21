part of 'injections.dart';

void injectUseCase() {
getIt.registerLazySingleton(() => SaveSubscribe(repository:getIt())); 
getIt.registerLazySingleton(() => SendSubscribe(repository:getIt())); 
}
