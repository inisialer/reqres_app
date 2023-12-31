import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:regres_app/models/response_get_users.dart';
import 'package:regres_app/services/api_service_user.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final ApiServiceUser _apiServiceUser = ApiServiceUser();
  UsersBloc() : super(UsersInitial()) {
    on<GetUsersEvent>((event, emit) async {
      emit(GetUsersLoading());
      try {
        final response = await _apiServiceUser.getUser();
        emit(GetUsersSuccess(ResponseGetUsers.fromJson(response.data)));
      } on DioException {
        emit(GetUsersError());
      } catch (e) {
        emit(GetUsersError());
      }
      // TODO: implement event handler
    });
    on<DeleteUsersEvent>((event, emit) async {
      emit(DeleteUsersLoading());
      try {
        final response = await _apiServiceUser.deleteUser(event.id);
        emit(DeleteUsersSuccess());
      } on DioException {
        emit(DeleteUsersError());
      } catch (e) {
        emit(DeleteUsersError());
      }
      // TODO: implement event handler
    });
  }
}
