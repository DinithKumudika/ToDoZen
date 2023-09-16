import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_zen/src/constants/colors.dart';
import 'package:to_do_zen/src/constants/strings.dart';
import 'package:to_do_zen/src/features/authentication/controllers/register_controller.dart';
import 'package:to_do_zen/src/widgets/circular_loader.dart';
import 'package:to_do_zen/src/widgets/snackbar_alert.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final FocusNode _inputNameFocusNode = FocusNode();
  final FocusNode _inputEmailFocusNode = FocusNode();
  final FocusNode _inputPasswordFocusNode = FocusNode();
  final FocusNode _inputConfirmPasswordFocusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();

  bool _isNameFocused = false;
  bool _isEmailFocused = false;
  bool _isPasswordFocused = false;
  bool _isConfirmPasswordFocused = false;

  bool _isNameFilled = false;
  bool _isEmailFilled = false;
  bool _isPasswordFilled = false;
  bool _isConfirmPasswordFilled = false;

  bool _isLoading = false;
  bool _passwordToggle = true;
  bool _confirmPasswordToggle = true;

  @override
  void initState() {
    super.initState();
    _inputNameFocusNode.addListener(() {
      setState(() {
        _isNameFocused = _inputNameFocusNode.hasFocus;
      });
    });

    _inputEmailFocusNode.addListener(() {
      setState(() {
        _isEmailFocused = _inputEmailFocusNode.hasFocus;
      });
    });

    _inputPasswordFocusNode.addListener(() {
      setState(() {
        _isPasswordFocused = _inputPasswordFocusNode.hasFocus;
      });
    });

    _inputConfirmPasswordFocusNode.addListener(() {
      setState(() {
        _isConfirmPasswordFocused = _inputConfirmPasswordFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _inputNameFocusNode.dispose();
    _inputEmailFocusNode.dispose();
    _inputPasswordFocusNode.dispose();
    _inputConfirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final registerController = Get.put(RegisterController());
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            SingleChildScrollView(
              child: SizedBox(
                height: size.height * 0.3,
                child: Column(
                  children: [
                    // name input field
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Name',
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
                          controller: registerController.name,
                          validator: (value) => validateName(value),
                          focusNode: _inputNameFocusNode,
                          keyboardType: TextInputType.text,
                          style: const TextStyle(color: COLOR_DARK_ALT),
                          onChanged: (value) {
                            value.isNotEmpty
                                ? setState(() {
                                    _isNameFilled = true;
                                  })
                                : setState(() {
                                    _isNameFilled = false;
                                  });
                          },
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person_outline_sharp,
                                color: _isNameFocused
                                    ? COLOR_PRIMARY.withOpacity(0.6)
                                    : Colors.grey.withOpacity(0.8),
                              ),
                              hintText: nameHintText,
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              hintStyle: TextStyle(
                                color: _isNameFocused
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
                              fillColor: _isNameFocused
                                  ? Colors.transparent
                                  : COLOR_LIGHT),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    // email input field
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
                          controller: registerController.email,
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
                              fillColor: _isEmailFocused
                                  ? Colors.transparent
                                  : COLOR_LIGHT),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    // password input field
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
                          controller: registerController.password,
                          validator: (value) => validatePassword(value),
                          focusNode: _inputPasswordFocusNode,
                          style: const TextStyle(color: COLOR_DARK_ALT),
                          obscureText: _passwordToggle,
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
                                icon: _passwordToggle
                                    ? const Icon(Icons.visibility)
                                    : const Icon(Icons.visibility_off),
                                color: Colors.grey.withOpacity(0.8),
                                onPressed: () {
                                  setState(() {
                                    _passwordToggle = !_passwordToggle;
                                  });
                                },
                              ),
                              filled: true,
                              fillColor: _isPasswordFocused
                                  ? Colors.transparent
                                  : COLOR_LIGHT),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    // confirm password input field
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Confirm Password',
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
                          controller: registerController.confirmPassword,
                          validator: (value) => validateConfirmPassword(
                            value,
                            registerController.password.text,
                          ),
                          focusNode: _inputConfirmPasswordFocusNode,
                          style: const TextStyle(color: COLOR_DARK_ALT),
                          obscureText: _confirmPasswordToggle,
                          onChanged: (value) {
                            value.isNotEmpty
                                ? setState(() {
                                    _isConfirmPasswordFilled = true;
                                  })
                                : setState(() {
                                    _isConfirmPasswordFilled = false;
                                  });
                          },
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock_outline_sharp,
                                color: _isPasswordFocused
                                    ? COLOR_PRIMARY.withOpacity(0.6)
                                    : Colors.grey.withOpacity(0.8),
                              ),
                              hintText: confirmPasswordHintText,
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
                                icon: _passwordToggle
                                    ? const Icon(Icons.visibility)
                                    : const Icon(Icons.visibility_off),
                                color: Colors.grey.withOpacity(0.8),
                                onPressed: () {
                                  setState(() {
                                    _passwordToggle = !_passwordToggle;
                                  });
                                },
                              ),
                              filled: true,
                              fillColor: _isPasswordFocused
                                  ? Colors.transparent
                                  : COLOR_LIGHT),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                      ],
                    ),
                  ],
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
                          String? error = await registerController.register(
                            registerController.email.text.trim(),
                            registerController.password.text.trim(),
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
                        "register".toUpperCase(),
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

String? validateConfirmPassword(String? password, String? confirmPassword) {
  if (confirmPassword!.isEmpty) {
    return "Retype your password";
  } else if (password != confirmPassword) {
    return "Check the password again";
  }
  return null;
}

String? validateName(String? name) {
  if (name!.isEmpty) {
    return "First name is required";
  }
  return null;
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
