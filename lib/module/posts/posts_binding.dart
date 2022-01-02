import 'package:flutter_web/core/providers/global_provider.dart';
import 'package:flutter_web/module/posts/data/datasource/posts_remote_datasource.dart';
import 'package:flutter_web/module/posts/data/models/post.dart';
import 'package:flutter_web/module/posts/data/repository/posts_repository.dart';
import 'package:flutter_web/module/posts/presentation/controller/posts_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Datasources
final _postsRemoteDataSourceProvider = Provider<PostsRemoteDataSource>(
  (ref) => PostsRemoteDataSource(
    dio: ref.read(dioProvider),
  ),
);

// Repository
final _postsRepositoryProvider = Provider<PostsRepository>(
  (ref) => PostsRepository(
    postsRemoteDataSource: ref.read(_postsRemoteDataSourceProvider),
  ),
);

// Controller
final postsControllerProvider =
    StateNotifierProvider<PostsController, AsyncValue<List<Post>>>(
  (ref) => PostsController(
    postsRepository: ref.read(_postsRepositoryProvider),
  )..getPosts(),
);
