import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/core/enum/theme_type.dart';
import 'package:flutter_web/core/providers/global_provider_binding.dart';
import 'package:flutter_web/routes/app_router.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  GoRouter.setUrlPathStrategy(UrlPathStrategy.path);
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Flutter Web Demo',
      routeInformationParser: AppRouter.router.routeInformationParser,
      routerDelegate: AppRouter.router.routerDelegate,
      theme: ref.watch(themeControllerProvider) == ThemeType.light
          ? FlexThemeData.light(scheme: FlexScheme.blumineBlue)
          : FlexThemeData.dark(scheme: FlexScheme.blumineBlue),
    );
  }
}
