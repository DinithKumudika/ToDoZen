import 'package:flutter/material.dart';
import 'package:to_do_zen/src/constants/colors.dart';
import 'package:to_do_zen/src/constants/strings.dart';
import 'package:to_do_zen/src/features/authentication/screens/login/widgets/google_auth.dart';
import 'package:to_do_zen/src/features/authentication/screens/register/widgets/register_form.dart';
import 'package:to_do_zen/src/features/authentication/screens/register/widgets/register_header.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: COLOR_DARK,
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: COLOR_LIGHT,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const RegisterForm(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.03,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              color: COLOR_DARK,
                              height: 1.0,
                              width: size.width * 0.4,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.02),
                              child: const Text(
                                "or",
                                style: TextStyle(
                                    fontSize: 17.0, color: COLOR_DARK_ALT),
                              ),
                            ),
                            Container(
                              color: COLOR_DARK,
                              height: 1.0,
                              width: size.width * 0.4,
                            ),
                          ],
                        ),
                      ),
                      const GoogleAuth(
                        buttonText: googleRegister,
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an Account?",
                    style: TextStyle(color: COLOR_GRAY, fontSize: 15.0),
                  ),
                  TextButton(
                    onPressed: () =>
                        Navigator.pushReplacementNamed(context, '/login'),
                    child: const Text(
                      "Login",
                      style: TextStyle(color: COLOR_PRIMARY, fontSize: 15.0),
                    ),
                  ),
                ],
              ),
            ),
            const Positioned(
              top: 40,
              left: 20,
              child: RegisterHeader(),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
