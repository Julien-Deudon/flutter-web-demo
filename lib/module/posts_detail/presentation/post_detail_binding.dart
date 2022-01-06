import 'package:flutter_web/core/providers/global_provider_binding.dart';
import 'package:flutter_web/module/posts_detail/data/datasource/post_detail_remote_datasource.dart';
import 'package:flutter_web/module/posts_detail/data/models/post_comment_model.dart';
import 'package:flutter_web/module/posts_detail/data/models/post_detail_model.dart';
import 'package:flutter_web/module/posts_detail/data/repository/post_detail_repository.dart';
import 'package:flutter_web/module/posts_detail/presentation/controller/post_detail_comments_controller.dart';
import 'package:flutter_web/module/posts_detail/presentation/controller/post_detail_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _postDetailRemoteDataSourceProvider = Provider(
  (ref) => PostDetailRemoteDatasource(
    dio: ref.read(dioProvider),
  ),
);

final _postDetailRepositoryProvider = Provider(
  (ref) => PostDetailRepository(
    postDetailRemoteDatasource: ref.read(_postDetailRemoteDataSourceProvider),
  ),
);

final postDetailControllerProvider = StateNotifierProvider.family<
    PostDetailController, AsyncValue<PostDetail>, String>(
  (ref, postId) => PostDetailController(
    postId,
    postDetailRepository: ref.read(_postDetailRepositoryProvider),
  )..getPostById(),
);

final postDetailCommentsControllerProvider = StateNotifierProvider.family<
    PostDetailCommentsController, AsyncValue<List<PostComment>>, String>(
  (ref, postId) => PostDetailCommentsController(
    postId,
    postDetailRepository: ref.read(_postDetailRepositoryProvider),
  )..getPostCommentsById(),
);
