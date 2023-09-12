import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:to_do_zen/src/constants/colors.dart';
import 'package:to_do_zen/src/constants/images.dart';
import 'package:to_do_zen/src/constants/strings.dart';
import 'package:to_do_zen/src/screens/on_boarding/widgets/on_boarding_page.dart';
import 'package:to_do_zen/src/screens/on_boarding/widgets/skip_button.dart';
import 'package:to_do_zen/src/screens/on_boarding/widgets/step_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
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
            onPageChangeCallback: onPageChange,
            slideIconWidget: const Icon(
              Icons.arrow_back_ios,
              color: COLOR_PRIMARY,
            ),
            enableSideReveal: true,
            waveType: WaveType.circularReveal,
            positionSlideIcon: 0.5,
            enableLoop: false,
          ),
          Positioned(
            bottom: 120,
            child: StepIndicator(
              step: controller.currentPage + 1,
            ),
          ),
          Positioned(
            top: 50,
            left: 20,
            child: SkipButton(
              onPressed: () => controller.jumpToPage(page: 1),
            ),
          ),
          Positioned(
            bottom: 40,
            child: FloatingActionButton(
              onPressed: () => {},
              backgroundColor: COLOR_PRIMARY,
              foregroundColor: COLOR_LIGHT,
              elevation: 4,
              child: const Icon(
                Icons.arrow_forward,
              ),
            ),
          ),
        ],
      ),
    );
  }

  onPageChange(int activePageIndex) {
    setState(() {
      currentPageIndex = activePageIndex;
    });
  }
}
