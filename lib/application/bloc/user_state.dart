part of 'user_bloc.dart';

@immutable
sealed class UserState extends Equatable {
  const UserState();
  @override
  List<Object?> get props => [];
}

final class UserInitialState extends UserState {
  const UserInitialState();
  @override
  List<Object?> get props => [];
}

final class UserLoadingState extends UserState {
  const UserLoadingState();
  @override
  List<Object?> get props => [];
}

final class UserCompleteState extends UserState {
  final List<UserModel>? users;
  const UserCompleteState(this.users);
  @override
  List<Object?> get props => [users];
}

final class UserErrorState extends UserState {
  final String errorMessage;
  const UserErrorState(this.errorMessage);
  @override

  List<Object?> get props => [errorMessage];
}
