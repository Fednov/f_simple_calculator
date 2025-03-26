import 'package:f_simple_calculator/core/utils/constants/dimensons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:universal_platform/universal_platform.dart';
import 'package:window_manager/window_manager.dart';

class AppSystemFunctions {
  static void dynamicSystemOverlayColorChange({required bool isDarkMode}) {
    switch (isDarkMode) {
      case false:
        SystemChrome.setSystemUIOverlayStyle(
            const SystemUiOverlayStyle(systemNavigationBarColor: Colors.white));
        break;
      case true:
        SystemChrome.setSystemUIOverlayStyle(
            const SystemUiOverlayStyle(systemNavigationBarColor: Colors.black));
        break;
      default:
        SystemChrome.setSystemUIOverlayStyle(
            const SystemUiOverlayStyle(systemNavigationBarColor: Colors.white));
    }
  }

  static Future<void> setPrefferedOrientations() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  static Future<void> setMinimumWindowSize() async {
    if (UniversalPlatform.isWindows ||
        UniversalPlatform.isMacOS ||
        UniversalPlatform.isMacOS) {
      await windowManager.ensureInitialized();
      WindowManager.instance.setMinimumSize(
        const Size(kMinimumWindowSizeWidth, kMinimumWindowSizeHeight),
      );
    }
  }
}
