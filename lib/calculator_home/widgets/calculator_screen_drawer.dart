import 'package:flutter/material.dart';

class CalculatorScreenDrawer extends StatelessWidget {
  const CalculatorScreenDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Center(
        child: Text(
          'С глубоким уважением\nФеднов А.Е.',
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}