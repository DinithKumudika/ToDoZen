import 'package:flutter/material.dart';
import 'package:to_do_zen/src/constants/colors.dart';
import 'package:to_do_zen/src/constants/strings.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Padding(
          padding: EdgeInsets.only(top: 30.0, bottom: 20.0),
          child: Text(
            loginTitle,
            style: TextStyle(
                color: COLOR_PRIMARY, fontSize: 35.0, fontWeight: FontWeight.w600,),
          ),
        ),
      ],
    );
  }
}
