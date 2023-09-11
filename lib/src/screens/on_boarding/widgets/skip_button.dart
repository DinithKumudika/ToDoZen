import 'package:flutter/material.dart';
import 'package:to_do_zen/src/constants/colors.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamedAndRemoveUntil(
        context,
        '/home',
        (Route<dynamic> route) => false,
      ),
      child: Text(
        'Skip'.toUpperCase(),
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: COLOR_PRIMARY,
          fontSize: 21.0,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
