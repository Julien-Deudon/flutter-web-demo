import 'package:flutter/material.dart';
import 'package:flutter_web/module/users/data/models/user_model.dart';
import 'package:getwidget/getwidget.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: GFCard(
        title: GFListTile(
          title: Text(user.name),
          subTitle: Text(user.email),
          avatar: const Icon(Icons.person),
        ),
        content: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(user.company.name),
              Text(user.phone),
              Text(user.website),
            ],
          ),
        ),
        buttonBar: GFButtonBar(
          children: [
            GFButton(
              onPressed: () {},
              text: 'Contact',
            )
          ],
        ),
      ),
    );
  }
}
