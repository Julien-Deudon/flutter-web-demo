import 'package:dartz/dartz.dart';
import 'package:flutter_web/module/posts/data/tools/failures.dart';
import 'package:flutter_web/module/posts_detail/data/datasource/post_detail_remote_datasource.dart';
import 'package:flutter_web/module/posts_detail/data/models/post_comment_model.dart';
import 'package:flutter_web/module/posts_detail/data/models/post_detail_model.dart';

class PostDetailRepository {
  PostDetailRepository(
      {required PostDetailRemoteDatasource postDetailRemoteDatasource})
      : _postDetailRemoteDatasource = postDetailRemoteDatasource;

  final PostDetailRemoteDatasource _postDetailRemoteDatasource;

  Future<Either<Failure, List<PostComment>>> getComments(String postId) async {
    try {
      final result = await _postDetailRemoteDatasource.getPostComments(postId);

      return Right(result);
    } catch (e) {
      return Left(PostCommentFailure());
    }
  }

  Future<Either<Failure, PostDetail>> getPostById(String postId) async {
    try {
      final result = await _postDetailRemoteDatasource.getPostById(postId);

      return Right(result);
    } catch (e) {
      return Left(PostDetailFailure());
    }
  }
}
