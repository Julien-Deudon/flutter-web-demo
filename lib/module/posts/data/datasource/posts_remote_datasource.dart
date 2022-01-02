import 'package:dio/dio.dart';
import 'package:flutter_web/module/posts/data/models/post.dart';

class PostsRemoteDataSource {
  PostsRemoteDataSource({required Dio dio}) : _dio = dio;

  final Dio _dio;

  Future<List<Post>> getPosts() async {
    final response =
        await _dio.get('https://jsonplaceholder.typicode.com/posts');

    if (response.statusCode != 200) {
      throw Exception();
    }

    return postFromJson(response.data);
  }
}
