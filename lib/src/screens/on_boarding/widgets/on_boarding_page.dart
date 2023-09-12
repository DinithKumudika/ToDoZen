import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:to_do_zen/src/constants/colors.dart';


class OnBoardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;
  final Color bgColor;

  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      color: bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            image,
            width: size.width * 0.7,
            height: size.height * 0.5,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: COLOR_DARK,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Text(
                  subTitle,
                  style: const TextStyle(
                    color: COLOR_DARK_ALT,
                    fontSize: 20.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: size.height * 0.05,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
