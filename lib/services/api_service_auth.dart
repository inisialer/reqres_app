import 'package:dio/dio.dart';
import 'package:regres_app/helper/constants.dart';

class ApiServiceAuth {
  final Dio _dio = Dio();

  Future<Response> login(
      {required String email, required String password}) async {
    final response = await _dio
        .post('${baseUrl}login', data: {"email": email, "password": password});
    return response;
  }

  Future<Response> register(
      {required String email, required String password}) async {
    final response = await _dio.post('${baseUrl}register',
        data: {"email": email, "password": password});
    return response;
  }

  Future<Response> logout() async {
    final response = await _dio.post(
      '${baseUrl}logout',
    );
    return response;
  }
}
