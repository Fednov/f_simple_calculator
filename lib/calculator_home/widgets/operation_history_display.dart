import 'package:f_simple_calculator/calculator_home/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../view_model/provider/calculator_screen_view_model_provider.dart';

class OperationHistoryDisplay extends ConsumerWidget {
  const OperationHistoryDisplay({super.key, required this.alignment});

  final Alignment alignment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var operationHistoryList = ref.watch(
        calculatorScreenViewModelProvider.select((value) => value.history));
    const paddingAll = 10.0;

    return Container(
      height: double.infinity,
      width: double.infinity,
      padding:
          const EdgeInsets.all(paddingAll).copyWith(right: paddingAll + 5.0),
      alignment: alignment,
      child: SingleChildScrollView(
        reverse: true,
        clipBehavior: Clip.antiAlias,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            ...operationHistoryList.map(
              (savedOperationtModel) => Padding(
                padding: const EdgeInsets.only(
                  top: 5.0,
                ),
                child: SavedOperationText(savedOperation: savedOperationtModel),
              ),
            )
          ],
        ),
      ),
    );
  }
}
