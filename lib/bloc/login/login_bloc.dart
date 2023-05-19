import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/login_repository.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    // on<EmailEvent>((event, emit) {

    //   if (event.email.isEmpty &&
    //       EmailValidator.validate(event.email) == false) {
    //     print('Email inavalid state');
    //     emit(LoginErrorState('Please enter the valid email'));
    //   } else {
    //     // print(event.email);
    //     print('Email Event emitted');
    //     emit(LoginEmailValidState());
    //   }
    // });
    // on<PasswordEvent>((event, emit) {
    //   if (event.password.isEmpty) {
    //     emit(LoginErrorState('Please enter the password'));
    //   } else {
    //     // print(event.password);
    //     print('Password event emitted');
    //     emit(LoginPasswordValidState());
    //   }
    // });
    on<LoginButtonEvent>((event, emit) async {
      emit(LoginLoadingState());
      try {
        await sendLoginRequest(event.email, event.password);

        emit(LoginLoadedState(event.email, event.password));
        print(event.email);
        print(event.password);
        print('LoginLoaded emitted.........');
      } catch (err) {
        emit(LoginErrorState(err.toString()));
      }
    });
    on<ClearFormEvent>((event, emit) {
      emit(LoginInitialState());
      print('Clearing form data');
    });
  }
}
