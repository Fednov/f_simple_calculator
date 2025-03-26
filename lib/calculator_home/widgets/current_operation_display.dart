import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widgets.dart';

class CurrentOperationDisplay extends ConsumerWidget {
  const CurrentOperationDisplay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(10),
      alignment: Alignment.bottomRight,
      height: double.infinity,
      width: double.infinity,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(flex: 1, child: CurrentOperandsDisplay()),
          Flexible(flex: 2, child: CurrentEnterDisplay()),
        ],
      ),
    );
  }
}
