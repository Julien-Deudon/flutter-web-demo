import 'package:hooks_riverpod/hooks_riverpod.dart';

class NavigationController extends StateNotifier<int> {
  NavigationController() : super(0);

  void changeIndex(int index) {
    state = index;
  }
}
