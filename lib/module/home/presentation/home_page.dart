import 'package:flutter/material.dart';
import 'package:flutter_web/module/home/home_binding.dart';
import 'package:flutter_web/module/posts/presentation/posts_page.dart';
import 'package:flutter_web/module/settings/presentation/settings_page.dart';
import 'package:flutter_web/module/users/presentation/users_page.dart';
import 'package:flutter_web/routes/app_router.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePage extends ConsumerStatefulWidget {
  HomePage({
    Key? key,
    required this.path,
  }) : super(key: key);

  final String path;

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  late PageController _controller;

  @override
  void initState() {
    final initialPage = AppRouter.nestedRoutes.entries
        .firstWhere((element) => element.value == widget.path)
        .key;
    _controller = PageController(
      initialPage: initialPage,
    );
    ref.read(navigationControllerProvider.notifier).changeIndex(initialPage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(navigationControllerProvider, (previous, int next) {
      switch (next) {
        case 0:
          context.go('/users');
          break;
        case 1:
          context.go('/posts');
          break;
        case 2:
          context.go('/settings');
          break;
      }
      _controller.animateToPage(next,
          duration: const Duration(
            milliseconds: 600,
          ),
          curve: Curves.ease);
    });

    return Scaffold(
      appBar: AppBar(),
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
              icon: const Icon(Icons.settings),
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
          SettingsPage(),
        ],
      ),
    );
  }
}
