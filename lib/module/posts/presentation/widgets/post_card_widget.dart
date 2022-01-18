import 'package:flutter/material.dart';
import 'package:flutter_web/module/posts/data/models/post.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:getwidget/getwidget.dart';
import 'package:go_router/go_router.dart';

class PostCardWidget extends StatelessWidget {
  const PostCardWidget({
    Key? key,
    required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => GoRouter.of(context).push('/posts/${post.id}'),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: GFCard(
          title: GFListTile(
            title: Text(
              post.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            avatar: const Icon(
              Icons.feed,
              size: 32,
            ),
          ),
          content: Text(post.body),
          buttonBar: GFButtonBar(children: [
            ElevatedButton(
              onPressed: () => GoRouter.of(context).push('/posts/${post.id}'),
              child: const Text(
                'View More',
              ),
            )
          ]),
        ),
      ),
    );
  }
}
