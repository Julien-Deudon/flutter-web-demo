import 'package:flutter/material.dart';
import 'package:flutter_web/core/enum/theme_type.dart';
import 'package:flutter_web/core/providers/global_provider_binding.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        SwitchListTile.adaptive(
          title: const Text('Dark theme'),
          value: ref.watch(themeControllerProvider) == ThemeType.dark,
          onChanged: (value) =>
              ref.read(themeControllerProvider.notifier).toggleTheme(),
        ),
      ],
    );
  }
}
