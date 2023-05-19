import 'package:ecom_app/bloc/add_users/add_users_event.dart';
import 'package:ecom_app/bloc/add_users/add_users_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/add_users_repository.dart';

class AddUserBloc extends Bloc<AddUserEvent, AddUserState> {
  AddUserBloc() : super(AddUserInitialState()) {
    on<SubmitButtonClickedEvent>((event, emit) async {
      emit(AddUserLoadingState());
      try {
        await addUserRequest(event.name, event.jobName);
        emit(AddUserLoadedState());
        print('Loaded User Emitted');
        print(event.name);
        print(event.jobName);
      } catch (error) {
        emit(AddUserErrorState(error.toString()));
      }
    });
  }
}
