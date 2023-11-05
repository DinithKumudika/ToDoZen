import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_zen/firebase_options.dart';

import 'package:to_do_zen/src/constants/colors.dart';
import 'package:to_do_zen/src/constants/images.dart';
import 'package:to_do_zen/src/repositories/auth_repository.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isLoaded = false;

  Future _onSavedPrefs(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // bool? isViewed = prefs.getBool('isOnBoard');

    bool? isViewed = prefs.getBool('isOnBoard');
    isViewed = true;
    print("The value of isViewed is: $isViewed");
    
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

  Future _initServices() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ).then(
      (value) => _onSavedPrefs(context).then(
        (value) {
          Get.put(
            AuthRepository(),
          );
          _isLoaded = true;
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _initServices();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
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
              SizedBox(
                height: size.height * 0.1,
              ),
              Container(
                child: _isLoaded
                    ? const SpinKitThreeBounce(
                        color: Colors.transparent,
                        size: 00.0,
                      )
                    : const SpinKitThreeBounce(
                        color: COLOR_PRIMARY,
                        size: 40.0,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
