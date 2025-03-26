import 'package:f_simple_calculator/core/extensions/bool_extension.dart';
import 'package:f_simple_calculator/core/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChangeThemeModeButton extends ConsumerWidget {
  const ChangeThemeModeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var themeMode = ref
        .watch(appSettingsViewModelProvider
            .select((appSettingsModel) => appSettingsModel.isDarkMode))
        .themeModeFromIsDarkModeBool();

    return IconButton(
      icon: themeMode == ThemeMode.light
          ? const Icon(Icons.dark_mode)
          : const Icon(Icons.light_mode),
      tooltip: themeMode == ThemeMode.light ? 'Тёмный режим' : 'Светлый режим',
      onPressed:
          ref.read(appSettingsViewModelProvider.notifier).themeModeSwitch,
    );
  }
}
