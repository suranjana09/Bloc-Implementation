abstract class LoginEvent {}

// class EmailEvent extends LoginEvent {
//   final String email;
//   EmailEvent(this.email);
// }

// class PasswordEvent extends LoginEvent {
//   final String password;
//   PasswordEvent(this.password);
// }

// // class EmailAndPasswordEvent extends LoginEvent {
// //   final String email;
// //   final String password;
// //   EmailAndPasswordEvent(this.email, this.password);
// // }
class LoginButtonEvent extends LoginEvent {
  final String email;
  final String password;
  LoginButtonEvent(this.email, this.password);
}

class ClearFormEvent extends LoginEvent {}
