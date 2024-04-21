
import 'package:equatable/equatable.dart';
import 'package:flutter_assurance/features/subscribe/domain/entities/user.dart';
class SubscribeState extends Equatable {
  final User user;

  const SubscribeState({
    required this.user,
  });

  @override
  List<Object> get props => [user];
  SubscribeState copyWith({
    User? user,
  }) {
    return SubscribeState(
      user: user ?? this.user,
    );
  }
}

class SubscribeInitial extends SubscribeState {
  const SubscribeInitial({
    super.user = const User(),
  });
}

class SubscribeErrorState extends SubscribeState {
  const SubscribeErrorState({
    super.user = const User(),
  });
}
 