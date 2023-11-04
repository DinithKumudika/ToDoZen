import 'package:flutter/material.dart';
import 'package:to_do_zen/src/constants/colors.dart';

class CircularLoader extends StatelessWidget {
  const CircularLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: COLOR_PRIMARY,
        backgroundColor: COLOR_GRAY,
        strokeWidth: 5,
      ),
    );
  }
}
