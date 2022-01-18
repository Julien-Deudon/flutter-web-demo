import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({
    Key? key,
    required this.onChange,
    required this.currentIndex,
  }) : super(key: key);

  final int currentIndex;
  final Function(int) onChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: SalomonBottomBar(
        currentIndex: currentIndex,
        onTap: onChange,
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Icons.person),
            title: const Text('Users'),
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.article),
            title: const Text('Posts'),
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.settings),
            title: const Text('Settings'),
          ),
        ],
      ),
    );
  }
}
