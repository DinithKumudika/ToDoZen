import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_zen/src/constants/colors.dart';
import 'package:to_do_zen/src/constants/strings.dart';
import 'package:to_do_zen/src/features/authentication/controllers/login_controller.dart';
import 'package:to_do_zen/src/widgets/circular_loader.dart';
import 'package:to_do_zen/src/widgets/snackbar_alert.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final FocusNode _inputEmailFocusNode = FocusNode();
  final FocusNode _inputPasswordFocusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();

  bool _isEmailFocused = false;
  bool _isPasswordFocused = false;
  bool _isEmailFilled = false;
  bool _isPasswordFilled = false;
  bool _isLoading = false;
  bool passwordToggle = true;

  @override
  void initState() {
    super.initState();
    _inputEmailFocusNode.addListener(() {
      setState(() {
        _isEmailFocused = _inputEmailFocusNode.hasFocus;
      });
    });

    _inputEmailFocusNode.addListener(() {
      setState(() {
        _isPasswordFocused = _inputPasswordFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _inputEmailFocusNode.dispose();
    _inputPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final loginController = Get.put(LoginController());

    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Email',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: COLOR_DARK_ALT,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                TextFormField(
                  controller: loginController.email,
                  validator: (value) => validateEmail(value),
                  focusNode: _inputEmailFocusNode,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(color: COLOR_DARK_ALT),
                  onChanged: (value) {
                    value.isNotEmpty
                        ? setState(() {
                            _isEmailFilled = true;
                          })
                        : setState(() {
                            _isEmailFilled = false;
                          });
                  },
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person_outline_sharp,
                        color: _isEmailFocused
                            ? COLOR_PRIMARY.withOpacity(0.6)
                            : Colors.grey.withOpacity(0.8),
                      ),
                      hintText: emailHintText,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      hintStyle: TextStyle(
                        color: _isEmailFocused
                            ? COLOR_PRIMARY.withOpacity(0.6)
                            : Colors.grey.withOpacity(0.8),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: COLOR_PRIMARY),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      filled: true,
                      fillColor:
                          _isEmailFocused ? Colors.transparent : COLOR_LIGHT),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Password',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: COLOR_DARK_ALT,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                TextFormField(
                  controller: loginController.password,
                  validator: (value) => validatePassword(value),
                  focusNode: _inputPasswordFocusNode,
                  style: const TextStyle(color: COLOR_DARK_ALT),
                  obscureText: passwordToggle,
                  onChanged: (value) {
                    value.isNotEmpty
                        ? setState(() {
                            _isPasswordFilled = true;
                          })
                        : setState(() {
                            _isPasswordFilled = false;
                          });
                  },
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock_outline_sharp,
                        color: _isPasswordFocused
                            ? COLOR_PRIMARY.withOpacity(0.6)
                            : Colors.grey.withOpacity(0.8),
                      ),
                      hintText: passwordHintText,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      hintStyle: TextStyle(
                        color: _isPasswordFocused
                            ? COLOR_PRIMARY.withOpacity(0.6)
                            : Colors.grey.withOpacity(0.8),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: COLOR_PRIMARY),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      suffixIcon: IconButton(
                        icon: passwordToggle
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                        color: Colors.grey.withOpacity(0.8),
                        onPressed: () {
                          setState(() {
                            passwordToggle = !passwordToggle;
                          });
                        },
                      ),
                      filled: true,
                      fillColor: _isPasswordFocused
                          ? Colors.transparent
                          : COLOR_LIGHT),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  "Forgot Password?",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: COLOR_PRIMARY,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Align(
              alignment: Alignment.center,
              child: _isLoading
                  ? const CircularLoader()
                  : ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            _isLoading = true;
                          });
                          String? error = await LoginController.instance.login(
                            loginController.email.text.trim(),
                            loginController.password.text.trim(),
                          );
                          setState(() {
                            _isLoading = false;
                          });

                          if (error != null) {
                            SnackbarAlert(
                              isError: true,
                              title: 'Error',
                              message: error,
                            ).show();
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(size.width * 0.9, 55.0),
                        elevation: 0,
                        backgroundColor: _isEmailFilled && _isPasswordFilled
                            ? COLOR_PRIMARY
                            : COLOR_SECONDARY.withOpacity(0.6),
                      ),
                      child: Text(
                        "login".toUpperCase(),
                        style: const TextStyle(fontSize: 20.0),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

String? validateEmail(String? email) {
  String regex =
      r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?";

  RegExp regExp = RegExp(regex);

  if (email!.isEmpty) {
    return "email is required";
  } else if (!regExp.hasMatch(email)) {
    return "invalid email";
  }
  return null;
}

String? validatePassword(String? password) {
  String regex =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regExp = RegExp(regex);

  if (password!.isEmpty) {
    return "password is required";
  } else if (password.length > 30) {
    return "password should be less than 30 characters";
  } else if (!regExp.hasMatch(password)) {
    return "invalid password";
  }
  return null;
}
