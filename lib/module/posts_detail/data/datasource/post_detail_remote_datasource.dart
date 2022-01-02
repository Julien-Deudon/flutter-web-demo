import 'package:dio/dio.dart';
import 'package:flutter_web/module/posts_detail/data/models/post_comment_model.dart';
import 'package:flutter_web/module/posts_detail/data/models/post_detail_model.dart';

class PostDetailRemoteDatasource {
  PostDetailRemoteDatasource({required Dio dio}) : _dio = dio;

  final Dio _dio;

  Future<List<PostComment>> getPostComments(String id) async {
    final response = await _dio
        .get('https://jsonplaceholder.typicode.com/posts/$id/comments');

    if (response.statusCode != 200) {
      throw Exception();
    }

    return postCommentsFromJson(response.data);
  }

  Future<PostDetail> getPostById(String id) async {
    final response =
        await _dio.get('https://jsonplaceholder.typicode.com/posts/$id');

    if (response.statusCode != 200) {
      throw Exception();
    }

    return postDetailFromJson(response.data);
  }
}
