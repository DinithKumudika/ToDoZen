import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:to_do_zen/src/constants/colors.dart';
import 'package:to_do_zen/src/constants/images.dart';
import 'package:to_do_zen/src/constants/strings.dart';
import 'package:to_do_zen/src/screens/on_boarding/widgets/on_boarding_page.dart';
import 'package:to_do_zen/src/screens/on_boarding/widgets/skip_button.dart';
import 'package:to_do_zen/src/screens/on_boarding/widgets/step_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});

  final controller = LiquidController();
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {

    final pages = [
      const OnBoardingPage(
        image: onBoarding1,
        title: onBoardingTitleFirst,
        subTitle: onBoardingSubTitleFirst,
        bgColor: COLOR_LIGHT,
      ),
      const OnBoardingPage(
        image: onBoarding2,
        title: onBoardingTitleSecond,
        subTitle: onBoardingSubTitleSecond,
        bgColor: COLOR_TERTIARY,
      ),
    ];

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            liquidController: controller,
            pages: pages,
            onPageChangeCallback: (int activePageIndex) => currentPageIndex = activePageIndex,
            slideIconWidget: const Icon(
              Icons.arrow_back_ios,
              color: COLOR_PRIMARY,
            ),
            enableSideReveal: true,
            waveType: WaveType.circularReveal,
          ),
          Positioned(
            bottom: 170,
            child: StepIndicator(
              step: currentPageIndex + 1,
            ),
          ),
          const Positioned(
            top: 50,
            left: 20,
            child: SkipButton(),
          ),
        ],
      ),
    );
  }
}
