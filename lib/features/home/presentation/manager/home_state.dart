part of 'home_bloc.dart';

class HomeState extends Equatable {
  final bool isLogged;

  const HomeState({
    required this.isLogged,
  });

  @override
  List<Object> get props => [isLogged];
}

class SubscribeInitial extends HomeState {
  const SubscribeInitial({
    super.isLogged = false,
  });
}

class ErrorState extends HomeState {
  const ErrorState({
    super.isLogged = false,
  });
}
