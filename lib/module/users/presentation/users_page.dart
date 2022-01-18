import 'package:flutter/material.dart';
import 'package:flutter_web/module/users/presentation/views/users_view.dart';
import 'package:flutter_web/module/users/users_bindings.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UsersPage extends ConsumerWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(userControllerProvider).when(
          data: (data) {
            return UsersView(users: data);
          },
          error: (error, _) => Center(
            child: Text(error.toString()),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        );
  }
}
