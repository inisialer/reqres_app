part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class PostLoginEvent extends AuthEvent {
  final String email;
  final String password;
  const PostLoginEvent({required this.email, required this.password});
}

class PostRegisterEvent extends AuthEvent {
  final String email;
  final String password;
  const PostRegisterEvent({required this.email, required this.password});
}

class PostLogoutEvent extends AuthEvent {}
