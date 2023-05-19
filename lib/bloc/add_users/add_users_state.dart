abstract class AddUserState {}

class AddUserInitialState extends AddUserState {}

class AddUserLoadingState extends AddUserState {}

class AddUserLoadedState extends AddUserState {}

class AddUserErrorState extends AddUserState {
  final String error;
  AddUserErrorState(this.error);
}
