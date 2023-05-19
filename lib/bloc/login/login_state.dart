abstract class LoginState {}

class LoginInitialState extends LoginState {}

// class LoginEmailValidState extends LoginState {}

// class LoginPasswordValidState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginLoadedState extends LoginState {
  final String email;
  final String password;
  LoginLoadedState(this.email, this.password);
}

class LoginErrorState extends LoginState {
  final String error;
  LoginErrorState(this.error);
}
