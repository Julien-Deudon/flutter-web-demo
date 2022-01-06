import 'package:flutter/material.dart';
import 'package:flutter_web/module/home/home_binding.dart';
import 'package:flutter_web/module/posts/presentation/posts_page.dart';
import 'package:flutter_web/module/users/presentation/users_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePage extends ConsumerWidget {
  HomePage({Key? key}) : super(key: key);

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(navigationControllerProvider, (previous, int next) {
      _controller.jumpToPage(next);
    });

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: SalomonBottomBar(
          currentIndex: ref.watch(navigationControllerProvider),
          onTap: (index) => ref
              .read(navigationControllerProvider.notifier)
              .changeIndex(index),
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
              icon: const Icon(Icons.article),
              title: const Text('Posts'),
            ),
          ],
        ),
      ),
      body: PageView(
        controller: _controller,
        children: const [
          UsersPage(),
          PostsPage(),
        ],
      ),
    );
  }
}
