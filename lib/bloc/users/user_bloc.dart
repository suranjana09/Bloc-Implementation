import 'package:ecom_app/bloc/users/user_event.dart';
import 'package:ecom_app/bloc/users/user_state.dart';
import 'package:ecom_app/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserLoadingState()) {
    on<UserListEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        final users = await getUserData();
        emit(UserLoadedState(users));
      } catch (error) {
        // print(error);
        emit(UserErrorState(error.toString()));
      }
    });
  }
}
