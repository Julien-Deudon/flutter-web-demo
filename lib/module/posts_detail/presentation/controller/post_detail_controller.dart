import 'package:flutter_web/module/posts_detail/data/models/post_detail_model.dart';
import 'package:flutter_web/module/posts_detail/data/repository/post_detail_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PostDetailController extends StateNotifier<AsyncValue<PostDetail>> {
  PostDetailController(this.postId,
      {required PostDetailRepository postDetailRepository})
      : _postDetailRepository = postDetailRepository,
        super(const AsyncValue.loading());

  final String postId;
  final PostDetailRepository _postDetailRepository;

  void getPostById() async {
    state = const AsyncValue.loading();

    final result = await _postDetailRepository.getPostById(postId);

    state = result.fold(
      (failure) => AsyncValue.error(failure),
      (post) => AsyncValue.data(post),
    );
  }
}
