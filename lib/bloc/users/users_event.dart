part of 'users_bloc.dart';

sealed class UsersEvent extends Equatable {
  const UsersEvent();

  @override
  List<Object> get props => [];
}

class GetUsersEvent extends UsersEvent {}

class DeleteUsersEvent extends UsersEvent {
  final String id;
  const DeleteUsersEvent(this.id);
}
