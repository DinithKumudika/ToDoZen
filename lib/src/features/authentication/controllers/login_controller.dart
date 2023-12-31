import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_zen/src/features/authentication/exceptions/auth_exception.dart';
import 'package:to_do_zen/src/features/tasks/screens/tasks_screen.dart';
import 'package:to_do_zen/src/features/tasks/screens/test.dart';
import 'package:to_do_zen/src/features/tasks/screens/widgets/task_list.dart';
import 'package:to_do_zen/src/repositories/auth_repository.dart';
import 'package:to_do_zen/src/features/core/screens/home/home_screen.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final RxBool isEmailFocused = false.obs;
  final RxBool isPasswordFocused = false.obs;
  final RxBool isLoading = false.obs;
  final RxBool isGoogleLoading = false.obs;
  final RxBool passwordToggle = true.obs;
  final RxBool isEnabled = false.obs;
  final RxBool isRegistered = false.obs;

  final email = TextEditingController();
  final password = TextEditingController();

  void togglePasswordVisibility() {
    passwordToggle.value = !passwordToggle.value;
  }

  void registered() {
    isRegistered.value = true;
  }

  bool enableLogin() {
    return email.text.isNotEmpty && password.text.isNotEmpty
        ? isEnabled.value = true
        : isEnabled.value = false;
  }

  void clearAll() {
    email.clear();
    password.clear();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  Future<String?> login(String emailValue, String passwordValue) async {
    try {
      await AuthRepository.instance
          .loginWithEmailAndPassword(emailValue, passwordValue);
      clearAll();
      Get.offAll(
        () =>  HomeScreen(),
      );
    } on AuthException catch (e) {
      print("AuthException: ${e.message}");
      return e.loginException();
    } catch (e) {
      print("Unexpected error: $e");
    }
    return null;
  }

  Future<String?> googleSignIn() async {
    try {
      isGoogleLoading.value = true;
      await AuthRepository.instance.signInWithGoogle();
      isGoogleLoading.value = false;
    } on AuthException catch (e) {
      print("AuthException: ${e.message}");
      return e.loginException();
    } catch (e) {
      print("Unexpected error: $e");
    }
    return null;
  }
}
