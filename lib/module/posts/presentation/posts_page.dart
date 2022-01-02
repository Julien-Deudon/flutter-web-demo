import 'package:flutter/material.dart';
import 'package:flutter_web/module/posts/posts_binding.dart';
import 'package:flutter_web/module/posts/presentation/widgets/post_card_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PostsPage extends ConsumerWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: ref.watch(postsControllerProvider).when(
              data: (data) {
                return ListView(
                  children: data
                      .map(
                        (post) => PostCardWidget(
                          post: post,
                          onTap: (postId) {
                            GoRouter.of(context).push('/posts/$postId');
                          },
                        ),
                      )
                      .toList(),
                );
              },
              error: (err, _) => Text(err.toString()),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
      ),
    );
  }
}
