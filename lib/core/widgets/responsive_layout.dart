import 'package:f_simple_calculator/core/utils/constants/dimensons.dart';
import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    super.key,
    required this.mobile,
    required this.miniWindow,
    required this.desktop,
  });

  final Widget mobile;
  final Widget miniWindow;
  final Widget desktop;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > kMobileWidth) {
          return desktop;
        } else if (constraints.maxHeight > kMiniWindowHeight) {
          return mobile;
        } else {
          return miniWindow;
        }
      },
    );
  }
}
