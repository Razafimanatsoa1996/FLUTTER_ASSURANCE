import 'package:flutter_assurance/features/subscribe/domain/entities/user.dart';
import 'package:flutter_assurance/features/subscribe/domain/use_cases/saveSubscribe.dart';
import 'package:flutter_assurance/features/subscribe/domain/use_cases/sendSubscribe.dart';
import 'package:flutter_assurance/features/subscribe/presentation/manager/subscribe_event.dart';
import 'package:flutter_assurance/features/subscribe/presentation/manager/subscribe_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubscribeBloc extends Bloc<SubscribeEvent, SubscribeState> {
  final SendSubscribe sendSubscribe;
  final SaveSubscribe saveSubscribe;
  SubscribeBloc(this.sendSubscribe,this.saveSubscribe)
      : super(const SubscribeState(user: User())) {
    on<SendSusEvent>(_send);
  }

  Future<void> _send(SendSusEvent event, Emitter<SubscribeState> emit) async {
    emit(state.copyWith(user: event.user));
    var res = await sendSubscribe(event.user);
    res.fold(
      (failure) {
        // Handle failure case
        print('Failed to send subscribe data: $failure');
      },
      (response) async{
        // Handle success case
        print('Subscribe data sent successfully: $response');
        await saveSubscribe(response);
        
      },
    );
  }
    Future<void> _save(SaveSusEvent event, Emitter<SubscribeState> emit) async {
      
    }
/* 
  final SaveUserInLocalUseCase saveUserInLocalUseCase;

  Future<void> _onUpdateUser(
      UpdateUserEvent event, Emitter<SubscribeState> emit) async {
    emit(state.copyWith(user: event.user));
  }

  Future<void> _onSaveUser(
      SaveUserEvent event, Emitter<SubscribeState> emit) async {
    saveUserInLocalUseCase(event.user);
  }  */
}
