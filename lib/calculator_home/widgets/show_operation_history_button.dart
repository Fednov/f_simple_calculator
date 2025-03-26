import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widgets.dart';

class ShowOperationHistoryButton extends ConsumerWidget {
  const ShowOperationHistoryButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var titleTextStyle = Theme.of(context)
        .textTheme
        .titleLarge
        ?.copyWith(fontWeight: FontWeight.bold);

    return IconButton(
      icon: const Icon(Icons.history),
      tooltip: 'История',
      onPressed: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Center(
                    child: Text(
                  'История:',
                  style: titleTextStyle,
                )),
                content: const SizedBox.expand(
                  child: OperationHistoryDisplay(
                    alignment: Alignment.topCenter,
                  ),
                ),
              )),
    );
  }
}
