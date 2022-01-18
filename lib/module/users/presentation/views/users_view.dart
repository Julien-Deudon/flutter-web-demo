import 'package:flutter/material.dart';
import 'package:flutter_web/core/const/breakpoints.dart';
import 'package:flutter_web/module/users/data/models/user_model.dart';
import 'package:flutter_web/module/users/presentation/widgets/user_widget.dart';

class UsersView extends StatelessWidget {
  const UsersView({
    Key? key,
    required this.users,
  }) : super(key: key);

  final List<User> users;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _getCrossAxisCount(screenWidth),
        mainAxisExtent: 262,
      ),
      children: users.map((user) => UserWidget(user: user)).toList(),
    );
  }

  int _getCrossAxisCount(double screenWidth) {
    if (screenWidth > kBreakPointDesktopLarge) return 4;
    if (screenWidth > kBreakPointDesktop) return 3;
    if (screenWidth > kBreakPointTablet) return 2;
    return 1;
  }
}
