import 'package:flutter/material.dart';
import 'package:flutter_web/module/users/data/models/user_model.dart';
import 'package:flutter_web/module/users/presentation/widgets/user_widget.dart';

class UsersMobileView extends StatelessWidget {
  const UsersMobileView({
    Key? key,
    required this.users,
  }) : super(key: key);

  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: users
          .map((user) => UserWidget(
                user: user,
              ))
          .toList(),
    );
  }
}
