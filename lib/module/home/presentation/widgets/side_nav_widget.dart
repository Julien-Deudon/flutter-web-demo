import 'package:flutter/material.dart';
import 'package:side_navigation/side_navigation.dart';

class SideNavWidget extends StatelessWidget {
  const SideNavWidget({
    Key? key,
    required this.onChange,
    required this.currentIndex,
  }) : super(key: key);

  final int currentIndex;
  final Function(int) onChange;

  @override
  Widget build(BuildContext context) {
    return SideNavigationBar(
      selectedIndex: currentIndex,
      items: const [
        SideNavigationBarItem(
          icon: Icons.person,
          label: 'Users',
        ),
        SideNavigationBarItem(
          icon: Icons.article,
          label: 'Posts',
        ),
        SideNavigationBarItem(
          icon: Icons.settings,
          label: 'Settings',
        ),
      ],
      onTap: onChange,
    );
  }
}
