import 'package:flutter/material.dart';
import 'package:to_do_zen/src/constants/colors.dart';
import 'package:to_do_zen/src/constants/images.dart';
import 'package:to_do_zen/src/constants/strings.dart';

class GoogleSignIn extends StatelessWidget {
  const GoogleSignIn({super.key});

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
          const Text(
            googleLogin,
            style: TextStyle(
              color: COLOR_DARK_ALT,
              fontSize: 18.0,
            ),
          ),
        ],
      ),
    );
    // Container(
    //   decoration: BoxDecoration(
    //     border: Border.all(width: 2, color: COLOR_GRAY),
    //     shape: BoxShape.circle,
    //   ),
    //   child: IconButton(
    //     onPressed: () {},
    //     style: OutlinedButton.styleFrom(
    //       side: BorderSide(
    //         width: 2.0,
    //         style: BorderStyle.solid,
    //         color: COLOR_LIGHT.withOpacity(0.5),
    //       ),
    //     ),
    //     icon: Image.asset(
    //       googleLogo,
    //       width: 30.0,
    //       height: 30.0,
    //     ),
    //   ),
    // );
  }
}
