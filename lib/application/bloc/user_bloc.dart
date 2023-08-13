import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:tdd/application/service/internet_checker_service.dart';
import 'package:tdd/domain/model/user_model.dart';
import 'package:tdd/domain/repository/user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserInitialState()) {
    on<UserGetEvent>(getUsers);
    add(const UserGetEvent());
  }

  final UserRepository _userRepository = UserRepository();

  Future<void> getUsers(UserGetEvent event, Emitter<UserState> emit) async {
    if (await InternetConnectionCheckerService().findConnectionState()) {
      emit(const UserLoadingState());
      var response = await _userRepository.getUsers();
      response.fold((err) => emit(UserErrorState(err)),
          (users) => emit(UserCompleteState(users)));
    } else {
      emit(const UserLoadingState());
      var response = await _userRepository.getUsersFromDB();
      response.fold((err) => emit(UserErrorState(err)),
          (users) => emit(UserCompleteState(users)));
    }
  }
}
