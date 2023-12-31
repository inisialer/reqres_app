part of 'users_bloc.dart';

sealed class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object> get props => [];
}

final class UsersInitial extends UsersState {}

final class GetUsersLoading extends UsersState {}

final class GetUsersError extends UsersState {}

final class GetUsersSuccess extends UsersState {
  final ResponseGetUsers data;
  const GetUsersSuccess(this.data);
}

final class DeleteUsersLoading extends UsersState {}

final class DeleteUsersError extends UsersState {}

final class DeleteUsersSuccess extends UsersState {}
