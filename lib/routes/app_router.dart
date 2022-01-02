import 'package:flutter_web/module/home/presentation/home_page.dart';
import 'package:flutter_web/module/posts/presentation/posts_page.dart';
import 'package:flutter_web/module/posts_detail/presentation/posts_detail_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/posts',
        builder: (context, state) => const PostsPage(),
      ),
      GoRoute(
        path: '/posts/:id',
        builder: (context, state) => const PostsDetailPage(),
      ),
    ],
  );
}
