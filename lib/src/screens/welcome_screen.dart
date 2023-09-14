import 'package:flutter/material.dart';
import 'package:to_do_zen/src/constants/colors.dart';
import 'package:to_do_zen/src/constants/strings.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: size.width,
            height: size.height,
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Text(
                      welcomeTitle,
                      style: TextStyle(
                        color: COLOR_DARK,
                        fontSize: 35.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.0,
                      ),
                      child: Text(
                        welcomeSubTitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: COLOR_DARK_ALT,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 50.0,
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: ()=> Navigator.pushNamed(context, '/login'),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(
                      size.width * 0.9,
                      size.height * 0.06,
                    ),
                    elevation: 0,
                    backgroundColor: COLOR_PRIMARY,
                  ),
                  child: Text(
                    'login'.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    fixedSize: Size(
                      size.width * 0.9,
                      size.height * 0.06,
                    ),
                    foregroundColor: COLOR_PRIMARY,
                    side: const BorderSide(
                      color: COLOR_PRIMARY,
                      width: 1.5,
                    ),
                  ),
                  child: Text(
                    'create account'.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
