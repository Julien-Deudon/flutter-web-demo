import 'package:flutter_web/core/enum/theme_type.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ThemeController extends StateNotifier<ThemeType> {
  ThemeController() : super(ThemeType.light);

  void toggleTheme() {
    if (state == ThemeType.light) {
      state = ThemeType.dark;
    } else {
      state = ThemeType.light;
    }
  }
}
