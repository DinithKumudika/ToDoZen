import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_zen/src/features/authentication/exceptions/auth_exception.dart';
import 'package:to_do_zen/src/repositories/auth_repository.dart';
import 'package:to_do_zen/src/features/core/screens/home/home_screen.dart';

class RegisterController extends GetxController {
  static RegisterController get instance => Get.find();

  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  Future<String?> register(String email, String password) async {
    try {
      await AuthRepository.instance.loginWithEmailAndPassword(email, password);
      Get.offAll(
        () => const HomeScreen(),
      );
    } on AuthException catch (e) {
      print("AuthException: ${e.message}");
      return e.loginException();
    } catch (e) {
      print("Unexpected error: $e");
    }
    return null;
  }
}
