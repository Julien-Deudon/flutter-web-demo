import 'package:flutter/material.dart';
import 'package:flutter_web/module/posts/data/models/post.dart';
import 'package:flutter_web/module/posts/presentation/widgets/post_card_widget.dart';

class PostDesktopView extends StatelessWidget {
  const PostDesktopView({
    Key? key,
    required this.posts,
  }) : super(key: key);

  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: posts.length,
      children: posts
          .map((post) => PostCardWidget(
                post: post,
              ))
          .toList(),
    );
  }
}
