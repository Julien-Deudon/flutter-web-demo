import 'package:flutter/material.dart';
import 'package:flutter_web/module/posts/data/models/post.dart';

class PostCardWidget extends StatelessWidget {
  const PostCardWidget({
    Key? key,
    required this.post,
    required this.onTap,
  }) : super(key: key);

  final Post post;
  final Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(post.id.toString()),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Text(
                  post.title,
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.center,
                ),
                const Divider(),
                Text(post.body),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
