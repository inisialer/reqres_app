part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class PostLoginLoading extends AuthState {}

final class PostLoginSuccess extends AuthState {}

final class PostLoginError extends AuthState {
  final String error;
  const PostLoginError(this.error);
}

final class PostRegisterLoading extends AuthState {}

final class PostRegisterSuccess extends AuthState {}

final class PostRegisterError extends AuthState {
  final String error;
  const PostRegisterError(this.error);
}

final class PostLogoutLoading extends AuthState {}

final class PostLogoutSuccess extends AuthState {}

final class PostLogoutError extends AuthState {
  final String error;
  const PostLogoutError(this.error);
}
