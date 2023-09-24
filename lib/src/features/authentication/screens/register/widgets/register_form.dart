import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:to_do_zen/src/constants/colors.dart';
import 'package:to_do_zen/src/constants/strings.dart';
import 'package:to_do_zen/src/features/authentication/controllers/register_controller.dart';
import 'package:to_do_zen/src/features/authentication/models/user_model.dart';
import 'package:to_do_zen/src/widgets/circular_loader.dart';
import 'package:to_do_zen/src/widgets/snackbar_alert.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final registerController = Get.put(RegisterController());
    final _formKey = GlobalKey<FormState>();
    String initialCountry = 'LK';
    PhoneNumber number = PhoneNumber(isoCode: 'LK', dialCode: '+94');

    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'First Name',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: COLOR_DARK_ALT,
                                fontSize: 18.0,
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Obx(
                              () => TextFormField(
                                controller: registerController.firstName,
                                validator: (value) => validateFirstName(value),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                keyboardType: TextInputType.text,
                                style: const TextStyle(color: COLOR_DARK_ALT),
                                onChanged: (value) {
                                  registerController.enableRegistration();
                                },
                                onTap: () {
                                  registerController.isFirstNameFocused.value =
                                      true;
                                  registerController.isLastNameFocused.value =
                                      false;
                                  registerController.isEmailFocused.value =
                                      false;
                                  registerController.isPhoneNoFocused.value =
                                      false;
                                  registerController.isPasswordFocused.value =
                                      false;
                                },
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.person_outline_sharp,
                                      color: registerController
                                              .isFirstNameFocused.value
                                          ? COLOR_PRIMARY.withOpacity(0.6)
                                          : Colors.grey.withOpacity(0.8),
                                    ),
                                    hintText: firstNameHintText,
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    hintStyle: TextStyle(
                                      color: registerController
                                              .isFirstNameFocused.value
                                          ? COLOR_PRIMARY.withOpacity(0.6)
                                          : Colors.grey.withOpacity(0.8),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: COLOR_PRIMARY),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    filled: true,
                                    fillColor: registerController
                                            .isFirstNameFocused.value
                                        ? Colors.transparent
                                        : COLOR_LIGHT),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      // email input field
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Last Name',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: COLOR_DARK_ALT,
                                fontSize: 18.0,
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Obx(
                              () => TextFormField(
                                controller: registerController.lastName,
                                validator: (value) => validateLastName(value),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                keyboardType: TextInputType.text,
                                style: const TextStyle(color: COLOR_DARK_ALT),
                                onChanged: (value) {
                                  registerController.enableRegistration();
                                },
                                onTap: () {
                                  registerController.isFirstNameFocused.value =
                                      false;
                                  registerController.isLastNameFocused.value =
                                      true;
                                  registerController.isEmailFocused.value =
                                      false;
                                  registerController.isPhoneNoFocused.value =
                                      false;
                                  registerController.isPasswordFocused.value =
                                      false;
                                },
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.person_outline_sharp,
                                      color: registerController
                                              .isLastNameFocused.value
                                          ? COLOR_PRIMARY.withOpacity(0.6)
                                          : Colors.grey.withOpacity(0.8),
                                    ),
                                    hintText: lastNameHintText,
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    hintStyle: TextStyle(
                                      color: registerController
                                              .isLastNameFocused.value
                                          ? COLOR_PRIMARY.withOpacity(0.6)
                                          : Colors.grey.withOpacity(0.8),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: COLOR_PRIMARY),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    filled: true,
                                    fillColor: registerController
                                            .isLastNameFocused.value
                                        ? Colors.transparent
                                        : COLOR_LIGHT),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
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
                      Obx(
                        () => TextFormField(
                          controller: registerController.email,
                          validator: (value) => validateEmail(value),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(color: COLOR_DARK_ALT),
                          onChanged: (value) {
                            registerController.enableRegistration();
                          },
                          onTap: () {
                            registerController.isFirstNameFocused.value = false;
                            registerController.isLastNameFocused.value = false;
                            registerController.isEmailFocused.value = true;
                            registerController.isPhoneNoFocused.value = false;
                            registerController.isPasswordFocused.value = false;
                          },
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person_outline_sharp,
                                color: registerController.isEmailFocused.value
                                    ? COLOR_PRIMARY.withOpacity(0.6)
                                    : Colors.grey.withOpacity(0.8),
                              ),
                              hintText: emailHintText,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              hintStyle: TextStyle(
                                color: registerController.isEmailFocused.value
                                    ? COLOR_PRIMARY.withOpacity(0.6)
                                    : Colors.grey.withOpacity(0.8),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: COLOR_PRIMARY),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              filled: true,
                              fillColor: registerController.isEmailFocused.value
                                  ? Colors.transparent
                                  : COLOR_LIGHT),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Phone No',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: COLOR_DARK_ALT,
                          fontSize: 18.0,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Obx(
                        () => InternationalPhoneNumberInput(
                          focusNode: registerController.phoneNoFocus,
                          textFieldController: registerController.phoneNo,
                          validator: (value) => validatePhoneNo(value),
                          autoValidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: const TextInputType.numberWithOptions(
                              signed: true, decimal: true),
                          textStyle: const TextStyle(
                            color: COLOR_DARK_ALT,
                          ),
                          formatInput: true,
                          initialValue: number,
                          selectorConfig: const SelectorConfig(
                            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                          ),
                          selectorTextStyle: const TextStyle(
                            color: COLOR_PRIMARY,
                          ),
                          inputDecoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.call_outlined,
                              color: registerController.isPhoneNoFocused.value
                                  ? COLOR_PRIMARY.withOpacity(0.6)
                                  : Colors.grey.withOpacity(0.8),
                            ),
                            hintText: phoneNoHintText,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            hintStyle: TextStyle(
                              color: registerController.isPhoneNoFocused.value
                                  ? COLOR_PRIMARY.withOpacity(0.6)
                                  : Colors.grey.withOpacity(0.8),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: COLOR_PRIMARY),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            filled: true,
                            fillColor: registerController.isPhoneNoFocused.value
                                ? Colors.transparent
                                : COLOR_LIGHT,
                          ),
                          onInputChanged: (PhoneNumber number) {
                            registerController.isFirstNameFocused.value = false;
                            registerController.isLastNameFocused.value = false;
                            registerController.isEmailFocused.value = false;
                            registerController.isPhoneNoFocused.value = true;
                            registerController.isPasswordFocused.value = false;
                            print("on changed: $number");
                          },
                          onSaved: (PhoneNumber number) {
                            registerController.isFirstNameFocused.value = false;
                            registerController.isLastNameFocused.value = false;
                            registerController.isEmailFocused.value = false;
                            registerController.isPhoneNoFocused.value = true;
                            registerController.isPasswordFocused.value = false;
                            print("on saved: $number");
                          },
                          onInputValidated: (bool value) {
                            print(value);
                          },
                        ),
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
                      Obx(
                        () => TextFormField(
                          controller: registerController.password,
                          validator: (value) => validatePassword(value),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          style: const TextStyle(color: COLOR_DARK_ALT),
                          obscureText: registerController.passwordToggle.value,
                          onChanged: (value) {
                            registerController.enableRegistration();
                          },
                          onTap: () {
                            registerController.isFirstNameFocused.value = false;
                            registerController.isLastNameFocused.value = false;
                            registerController.isEmailFocused.value = false;
                            registerController.isPhoneNoFocused.value = false;
                            registerController.isPasswordFocused.value = true;
                          },
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock_outline_sharp,
                                color:
                                    registerController.isPasswordFocused.value
                                        ? COLOR_PRIMARY.withOpacity(0.6)
                                        : Colors.grey.withOpacity(0.8),
                              ),
                              hintText: passwordHintText,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              hintStyle: TextStyle(
                                color:
                                    registerController.isPasswordFocused.value
                                        ? COLOR_PRIMARY.withOpacity(0.6)
                                        : Colors.grey.withOpacity(0.8),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: COLOR_PRIMARY),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              suffixIcon: IconButton(
                                icon: registerController.passwordToggle.value
                                    ? const Icon(Icons.visibility)
                                    : const Icon(Icons.visibility_off),
                                color: Colors.grey.withOpacity(0.8),
                                onPressed: () {
                                  registerController.togglePasswordVisibility();
                                },
                              ),
                              filled: true,
                              fillColor:
                                  registerController.isPasswordFocused.value
                                      ? Colors.transparent
                                      : COLOR_LIGHT),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Obx(
              () => Align(
                alignment: Alignment.center,
                child: registerController.isLoading.value
                    ? const CircularLoader()
                    : ElevatedButton(
                        onPressed: registerController.isEnabled.value
                            ? () async {
                                print(
                                    "${number.dialCode!} ${registerController.phoneNo.text.trim()}");

                                if (_formKey.currentState!.validate()) {
                                  registerController.isLoading.value = true;

                                  final user = UserModel(
                                      email:
                                          registerController.email.text.trim(),
                                      firstName: registerController
                                          .firstName.text
                                          .trim(),
                                      lastName: registerController.lastName.text
                                          .trim(),
                                      phoneNo:
                                          "${number.dialCode!} ${registerController.phoneNo.text.trim()}");

                                  String? error =
                                      await registerController.register(
                                    user,
                                    registerController.password.text.trim(),
                                  );

                                  if (error != null) {
                                    registerController.isLoading.value = false;
                                    SnackbarAlert(
                                      isError: true,
                                      title: 'Error',
                                      message: error,
                                    ).show();
                                  } else {
                                    registerController.isLoading.value = false;
                                    const SnackbarAlert(
                                      isError: false,
                                      title: 'Success',
                                      message: 'Registration Successful!',
                                    ).show();
                                    // ignore: use_build_context_synchronously
                                    Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      '/login',
                                      (route) => false,
                                    );
                                  }
                                }
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(size.width * 0.9, 55.0),
                          elevation: 0,
                          backgroundColor: registerController.isEnabled.value
                              ? COLOR_PRIMARY
                              : COLOR_SECONDARY.withOpacity(0.6),
                        ),
                        child: Text(
                          "register".toUpperCase(),
                          style: const TextStyle(fontSize: 20.0),
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String? validateFirstName(String? name) {
  if (name!.isEmpty) {
    return "First name is required";
  }
  return null;
}

String? validateLastName(String? name) {
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

String? validatePhoneNo(String? value) {
  if (value!.isEmpty) {
    return "phone no is required";
  } else if (value.trim().length != 11) {
    return "invalid phone no";
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
