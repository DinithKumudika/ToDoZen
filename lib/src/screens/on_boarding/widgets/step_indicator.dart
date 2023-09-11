import 'package:flutter/material.dart';
import 'package:to_do_zen/src/constants/colors.dart';

class StepIndicator extends StatelessWidget {
  final int step;

  const StepIndicator({
    super.key,
    required this.step,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 5.0,
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          width: 30.0,
          color: step == 1 ? COLOR_DARK_ALT : COLOR_GRAY,
        ),
        Container(
          height: 5.0,
          width: 30.0,
          color: step == 2 ? COLOR_DARK_ALT : COLOR_GRAY,
        ),
        Container(
          height: 5.0,
          width: 30.0,
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          color: step == 3 ? COLOR_DARK_ALT : COLOR_GRAY,
        ),
      ],
    );
  }
}
