import 'package:dio/dio.dart';
import 'package:flutter_web/core/providers/theme_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final dioProvider = Provider<Dio>(
  (ref) => Dio(),
);

final themeControllerProvider = StateNotifierProvider(
  (ref) => ThemeController(),
);
