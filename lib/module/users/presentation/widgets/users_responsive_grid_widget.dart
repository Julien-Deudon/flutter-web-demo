import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/module/users/data/models/user_model.dart';
import 'package:flutter_web/module/users/presentation/widgets/user_widget.dart';
import 'package:responsive_grid/responsive_grid.dart';

class UsersResponsiveGridWidget extends StatelessWidget {
  const UsersResponsiveGridWidget({
    Key? key,
    required this.users,
  }) : super(key: key);

  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ResponsiveGridRow(
          children: users
              .map((user) => ResponsiveGridCol(
                  sm: 6,
                  md: 6,
                  lg: 4,
                  xl: 3,
                  child: UserWidget(
                    user: user,
                  )))
              .toList()),
    );
  }
}
