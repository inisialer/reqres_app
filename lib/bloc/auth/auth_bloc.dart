import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:regres_app/services/api_service_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final ApiServiceAuth _apiServiceAuth = ApiServiceAuth();
  AuthBloc() : super(AuthInitial()) {
    on<PostLoginEvent>((event, emit) async {
      emit(PostLoginLoading());
      try {
        final response = await _apiServiceAuth.login(
            email: event.email, password: event.password);
        emit(PostLoginSuccess());
      } on DioException catch (e) {
        emit(PostLoginError(e.response?.data['error']));
      } catch (e) {
        emit(PostLoginError(e.toString()));
      }
      // TODO: implement event handler
    });
    on<PostRegisterEvent>((event, emit) async {
      emit(PostRegisterLoading());
      try {
        final response = await _apiServiceAuth.register(
            email: event.email, password: event.password);
        emit(PostRegisterSuccess());
      } on DioException catch (e) {
        emit(PostRegisterError(e.response?.data['error']));
      } catch (e) {
        emit(PostRegisterError(e.toString()));
      }
      // TODO: implement event handler
    });
    on<PostLogoutEvent>((event, emit) async {
      emit(PostLogoutLoading());
      try {
        final response = await _apiServiceAuth.logout();
        emit(PostLogoutSuccess());
      } on DioException catch (e) {
        emit(PostLogoutError(e.response?.data['error']));
      } catch (e) {
        emit(PostLogoutError(e.toString()));
      }
      // TODO: implement event handler
    });
  }
}
