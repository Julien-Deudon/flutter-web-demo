import 'package:flutter_web/module/home/controllers/navigation_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final navigationControllerProvider =
    StateNotifierProvider<NavigationController, int>(
  (ref) => NavigationController(),
);
