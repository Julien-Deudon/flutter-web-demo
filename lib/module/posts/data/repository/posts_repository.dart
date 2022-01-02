import 'package:dartz/dartz.dart';
import 'package:flutter_web/module/posts/data/datasource/posts_remote_datasource.dart';
import 'package:flutter_web/module/posts/data/models/post.dart';
import 'package:flutter_web/module/posts/data/tools/failures.dart';

class PostsRepository {
  PostsRepository({required PostsRemoteDataSource postsRemoteDataSource})
      : _postsRemoteDataSource = postsRemoteDataSource;

  final PostsRemoteDataSource _postsRemoteDataSource;

  Future<Either<Failure, List<Post>>> getPosts() async {
    try {
      final result = await _postsRemoteDataSource.getPosts();

      return Right(result);
    } catch (e) {
      return Left(PostFailure());
    }
  }
}
