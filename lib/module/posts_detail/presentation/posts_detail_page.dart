import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/module/posts_detail/post_detail_binding.dart';
import 'package:flutter_web/module/posts_detail/presentation/widgets/comment_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PostsDetailPage extends ConsumerWidget {
  const PostsDetailPage({Key? key, required this.postId}) : super(key: key);

  final String postId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ref.watch(postDetailControllerProvider(postId)).when(
                    data: (data) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.title,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          data.body,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ],
                    ),
                    error: (error, _) => Text(error.toString()),
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
              const SizedBox(
                height: 16,
              ),
              const Divider(),
              const SizedBox(
                height: 16,
              ),
              ref.watch(postDetailCommentsControllerProvider(postId)).when(
                    data: (data) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              'Comments section',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                          ListView(
                            shrinkWrap: true,
                            children: data
                                .map(
                                  (postComment) => CommentWidget(
                                    postComment: postComment,
                                  ),
                                )
                                .toList(),
                          )
                        ],
                      );
                    },
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
