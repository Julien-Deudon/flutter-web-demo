import 'package:flutter/material.dart';
import 'package:flutter_web/module/posts/data/models/post.dart';
import 'package:flutter_web/module/posts/presentation/widgets/post_card_widget.dart';
import 'package:responsive_grid/responsive_grid.dart';

class PostResponsiveGridWidget extends StatelessWidget {
  const PostResponsiveGridWidget({
    Key? key,
    required this.posts,
  }) : super(key: key);

  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ResponsiveGridRow(
          children: posts
              .map((post) => ResponsiveGridCol(
                  sm: 6,
                  md: 6,
                  lg: 4,
                  xl: 3,
                  child: PostCardWidget(
                    post: post,
                  )))
              .toList()),
    );
  }
}
