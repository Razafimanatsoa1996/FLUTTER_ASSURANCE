import 'package:flutter_assurance/features/splashcreen/presentation/manager/splash_event.dart';
import 'package:flutter_assurance/features/splashcreen/presentation/manager/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashBloc() : super(Initial()) {
    on<SetSplash>((event, emit) async {
      emit(Initial());
      emit(Loading());
      await Future.delayed(const Duration(seconds: 5));
      emit(Loaded());
    });
  }
}
