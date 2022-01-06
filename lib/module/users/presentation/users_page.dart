import 'package:flutter/material.dart';
import 'package:flutter_web/module/users/presentation/widgets/user_widget.dart';
import 'package:flutter_web/module/users/users_bindings.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UsersPage extends ConsumerWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(userControllerProvider).when(
          data: (data) {
            return ListView(
              shrinkWrap: true,
              children: data
                  .map((user) => UserWidget(
                        user: user,
                      ))
                  .toList(),
            );
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
