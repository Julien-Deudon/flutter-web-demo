import 'package:flutter/material.dart';
import 'package:flutter_web/module/posts/posts_binding.dart';
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
                      .map((post) => Card(
                            child: Text(post.title),
                          ))
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
