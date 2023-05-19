import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable {}

//data loading state
class UserLoadingState extends UserState {
  @override
  List<Object?> get props => [];
}

//data loaded state
class UserLoadedState extends UserState {
  UserLoadedState(this.users);
  final List users;
  @override
  List<Object?> get props => [users];
}

// Error state
class UserErrorState extends UserState {
  UserErrorState(this.error);
  final String error;
  @override
  List<Object?> get props => [error];
}
