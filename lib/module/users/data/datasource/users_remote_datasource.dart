import 'package:dio/dio.dart';
import 'package:flutter_web/module/users/data/models/user_model.dart';

class UsersRemoteDataSource {
  UsersRemoteDataSource({required Dio dio}) : _dio = dio;

  final Dio _dio;

  Future<List<User>> getUsers() async {
    final response =
        await _dio.get('https://jsonplaceholder.typicode.com/users');

    if (response.statusCode != 200) {
      throw Exception();
    }

    return userFromJson(response.data);
  }
}
