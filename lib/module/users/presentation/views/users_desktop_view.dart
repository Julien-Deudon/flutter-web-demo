import 'package:flutter/material.dart';
import 'package:flutter_web/module/users/data/models/user_model.dart';

class UsersDesktopView extends StatelessWidget {
  const UsersDesktopView({
    Key? key,
    required this.users,
    required this.screenWidth,
  }) : super(key: key);

  final List<User> users;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
