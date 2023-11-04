import 'package:flutter/material.dart';
import 'package:to_do_zen/src/constants/colors.dart';
import 'package:to_do_zen/src/constants/images.dart';
import 'package:to_do_zen/src/constants/strings.dart';

class GoogleAuth extends StatelessWidget {
  final String buttonText;
  const GoogleAuth({
    required this.buttonText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        fixedSize: Size(size.width * 0.9, 55.0),
        side: const BorderSide(
          color: COLOR_PRIMARY,
          width: 1.3,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            googleLogo,
            width: 30.0,
            height: 30.0,
          ),
          SizedBox(
            width: size.width * 0.02,
          ),
          Text(
            buttonText,
            style: const TextStyle(
              color: COLOR_DARK_ALT,
              fontSize: 18.0,
            ),
          ),
        ],
      ),
    );
  }
}
