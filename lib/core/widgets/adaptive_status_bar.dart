import 'package:f_simple_calculator/core/settings/settings.dart';
import 'package:f_simple_calculator/core/utils/system_functions/app_system_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdaptiveStatusBar extends ConsumerWidget {
  const AdaptiveStatusBar({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //Set system overlay color by app theme mode

    ref.listenManual(
        appSettingsViewModelProvider
            .select((appSettingsModel) => appSettingsModel.isDarkMode),
        (previos, next) => AppSystemFunctions.dynamicSystemOverlayColorChange(
            isDarkMode: next),
        fireImmediately: true);

    return child;
  }
}
