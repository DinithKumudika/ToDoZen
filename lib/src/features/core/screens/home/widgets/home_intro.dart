import 'package:flutter/material.dart';
import 'package:to_do_zen/src/constants/colors.dart';
import 'package:to_do_zen/src/constants/images.dart';
import 'package:to_do_zen/src/constants/strings.dart';
import 'package:to_do_zen/src/repositories/auth_repository.dart';

class HomeIntro extends StatelessWidget {
  const HomeIntro({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: size.height * 0.1,
        ),
        Image.asset(
          home,
          width: size.width * 0.7,
        ),
        SizedBox(
          height: size.height * 0.06,
        ),
        Column(
          children: [
            const Center(
              child: Text(
                emptyHomeTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: COLOR_DARK_ALT,
                  fontSize: 25.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            const Text(
              emptyHomeSubTitle,
              style: TextStyle(
                color: COLOR_DARK_ALT,
                fontSize: 20.0,
              ),
            )
          ],
        ),
      ],
    );
  }
}
