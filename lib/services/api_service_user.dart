import 'package:dio/dio.dart';
import 'package:regres_app/helper/constants.dart';

class ApiServiceUser {
  final Dio _dio = Dio();

  Future<Response> getUser() async {
    final response = await _dio.get(
      '${baseUrl}users',
    );
    return response;
  }

  Future<Response> deleteUser(String id) async {
    final response = await _dio.delete(
      '${baseUrl}users/$id',
    );
    return response;
  }
}
