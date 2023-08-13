part of 'user_bloc.dart';

@immutable
sealed class UserEvent extends Equatable {
  const UserEvent();
}

final class UserGetEvent extends UserEvent {
  const UserGetEvent();
  @override
  List<Object?> get props => [];
}
