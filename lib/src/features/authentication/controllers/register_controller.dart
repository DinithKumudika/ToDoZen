import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_zen/src/features/authentication/exceptions/auth_exception.dart';
import 'package:to_do_zen/src/features/authentication/models/user_model.dart';
import 'package:to_do_zen/src/repositories/auth_repository.dart';
import 'package:to_do_zen/src/features/core/screens/home/home_screen.dart';
import 'package:to_do_zen/src/repositories/user_repository.dart';

class RegisterController extends GetxController {
  static RegisterController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final phoneNo = TextEditingController();
  final password = TextEditingController();

  final RxBool isFirstNameFocused = false.obs;
  final RxBool isLastNameFocused = false.obs;
  final RxBool isEmailFocused = false.obs;
  final RxBool isPhoneNoFocused = false.obs;
  final RxBool isPasswordFocused = false.obs;

  final FocusNode phoneNoFocus = FocusNode();

  final RxBool isLoading = false.obs;
  final RxBool passwordToggle = true.obs;
  final RxBool isEnabled = false.obs;

  final userRepository = Get.put(UserRepository());

  @override
  void onInit() {
    phoneNoFocus.addListener(() {
      if (phoneNoFocus.hasFocus) {
        isPhoneNoFocused.value = true;
        isFirstNameFocused.value = false;
        isLastNameFocused.value = false;
        isEmailFocused.value = false;
        isPasswordFocused.value = false;
      } else {
        isPhoneNoFocused.value = false;
      }
    });
  }

  void togglePasswordVisibility() {
    passwordToggle.value = !passwordToggle.value;
  }

  bool enableRegistration() {
    return firstName.text.isNotEmpty &&
            lastName.text.isNotEmpty &&
            email.text.isNotEmpty &&
            phoneNo.text.isNotEmpty &&
            password.text.isNotEmpty
        ? isEnabled.value = true
        : isEnabled.value = false;
  }

  @override
  void dispose() {
    firstName.dispose();
    lastName.dispose();
    email.dispose();
    phoneNo.dispose();
    password.dispose();
    super.dispose();
  }

  Future<String?> register(UserModel user, String password) async {
    try {
      String? uid = await AuthRepository.instance
          .createUserWithEmailAndPassword(user.email, password);
      await createUser(uid!, user);
    } on AuthException catch (e) {
      print("AuthException: ${e.message}");
      return e.registrationException();
    } catch (e) {
      print("Unexpected error: $e");
    }
    return null;
  }

  Future<void> createUser(String uid, UserModel user) async {
    if (user.firstName.isNotEmpty &&
        user.lastName.isNotEmpty &&
        user.phoneNo.isNotEmpty) {
      await userRepository.createUser(uid, user);
      // phoneAuthentication(user.phoneNo);
    }
  }

  Future<void> emailAuthentication(String email) async {}
}
