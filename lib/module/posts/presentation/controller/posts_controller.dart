import 'package:flutter_web/module/posts/data/models/post.dart';
import 'package:flutter_web/module/posts/data/repository/posts_repository.dart';
import 'package:riverpod/riverpod.dart';

class PostsController extends StateNotifier<AsyncValue<List<Post>>> {
  PostsController({
    required PostsRepository postsRepository,
  })  : _postRepository = postsRepository,
        super(const AsyncValue.loading());

  final PostsRepository _postRepository;

  void getPosts() async {
    state = const AsyncValue.loading();

    final result = await _postRepository.getPosts();

    state = result.fold(
      (failure) => AsyncValue.error(failure),
      (posts) => AsyncValue.data(posts),
    );
  }
}
