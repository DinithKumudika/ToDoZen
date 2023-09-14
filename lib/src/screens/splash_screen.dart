import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_zen/src/constants/colors.dart';
import 'package:to_do_zen/src/constants/images.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future _onTap(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isViewed = prefs.getBool('isOnBoard');
    
    if (isViewed!) {
      // ignore: use_build_context_synchronously
      print(isViewed);
      Navigator.pushReplacementNamed(context, '/welcome');
    } else {
      print(isViewed);
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/on_boarding');
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onTap(context),
      child: Scaffold(
        backgroundColor: COLOR_DARK,
        body: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: COLOR_LIGHT,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      logo,
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.2,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Text(
                  'ToDoZen',
                  style: TextStyle(
                    color: COLOR_DARK,
                    fontSize: 40.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
