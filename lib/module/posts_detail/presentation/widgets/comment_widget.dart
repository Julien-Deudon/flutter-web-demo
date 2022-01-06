import 'package:flutter/material.dart';
import 'package:flutter_web/module/posts_detail/data/models/post_comment_model.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget({
    Key? key,
    required this.postComment,
  }) : super(key: key);

  final PostComment postComment;

  @override
  Widget build(BuildContext context) {
    return GFCard(
      title: GFListTile(
        title: Text(postComment.name),
      ),
      content: Text(postComment.body),
    );
  }
}
