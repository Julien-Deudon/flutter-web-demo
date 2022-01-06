import 'package:flutter/material.dart';
import 'package:flutter_web/module/posts_detail/presentation/post_detail_binding.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PostsDetailPage extends ConsumerWidget {
  const PostsDetailPage({Key? key, required this.postId}) : super(key: key);

  final String postId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print(postId);
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ref.watch(postDetailControllerProvider(postId)).when(
                    data: (data) => Text(data.title),
                    error: (error, _) => Text(error.toString()),
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
              ref.watch(postDetailCommentsControllerProvider(postId)).when(
                    data: (data) => ListView(
                      shrinkWrap: true,
                      children: data.map((e) => Text(e.email)).toList(),
                    ),
                    error: (error, _) => Text(error.toString()),
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
            ],
          ),
        ));
  }
}
