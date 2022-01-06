import 'package:flutter_web/module/home/presentation/home_page.dart';
import 'package:flutter_web/module/posts_detail/presentation/posts_detail_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        redirect: (_) => '/users',
      ),
      GoRoute(
        path: '/:path',
        builder: (context, state) =>
            HomePage(path: state.params['path'] ?? 'users'),
        routes: [
          GoRoute(
            path: 'users',
            //builder: (context, state) => const UsersPage(),
          ),
          GoRoute(
            path: 'posts',
            //builder: (context, state) => const PostsPage(),
          ),
          GoRoute(
            path: 'settings',
            //builder: (context, state) => const SettingsPage(),
          ),
        ],
      ),
      GoRoute(
        path: '/posts/:id',
        builder: (context, state) => PostsDetailPage(
          postId: state.params['id'] ?? '1',
        ),
      ),
    ],
  );

  static final Map<int, String> nestedRoutes = {
    0: 'users',
    1: 'posts',
    2: 'settings',
  };
}
