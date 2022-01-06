import 'package:flutter/material.dart';
import 'package:flutter_web/module/posts/data/models/post.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:getwidget/getwidget.dart';

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
        child: GFCard(
          // shape: RoundedRectangleBorder(
          //   side: BorderSide(color: Theme.of(context).primaryColor),
          //   borderRadius: BorderRadius.circular(8),
          // ),
          title: GFListTile(
            titleText: post.title,
          ),
          content: Text(post.body),
          buttonBar: GFButtonBar(children: [
            ElevatedButton(
              onPressed: () => onTap(post.id.toString()),
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
