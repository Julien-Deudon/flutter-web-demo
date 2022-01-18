import 'package:flutter/material.dart';
import 'package:flutter_web/core/const/breakpoints.dart';
import 'package:flutter_web/module/home/home_binding.dart';
import 'package:flutter_web/module/home/presentation/widgets/bottom_nav_bar_widget.dart';
import 'package:flutter_web/module/home/presentation/widgets/side_nav_widget.dart';
import 'package:flutter_web/module/posts/presentation/posts_page.dart';
import 'package:flutter_web/module/settings/presentation/settings_page.dart';
import 'package:flutter_web/module/users/presentation/users_page.dart';
import 'package:flutter_web/routes/app_router.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
    final screenWidth = MediaQuery.of(context).size.width;

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
      _controller.animateToPage(
        next,
        duration: const Duration(
          milliseconds: 600,
        ),
        curve: Curves.ease,
      );
    });

    return Scaffold(
        appBar: AppBar(),
        bottomNavigationBar: screenWidth < kBreakPointTablet
            ? BottomNavBarWidget(
                currentIndex: ref.watch(navigationControllerProvider),
                onChange: (index) => ref
                    .read(navigationControllerProvider.notifier)
                    .changeIndex(index),
              )
            : null,
        body: Row(
          children: [
            if (screenWidth > kBreakPointTablet)
              SideNavWidget(
                onChange: (index) => ref
                    .read(navigationControllerProvider.notifier)
                    .changeIndex(index),
                currentIndex: ref.watch(navigationControllerProvider),
              ),
            Expanded(
              child: PageView(
                controller: _controller,
                children: const [
                  UsersPage(),
                  PostsPage(),
                  SettingsPage(),
                ],
              ),
            ),
          ],
        ));
  }
}
