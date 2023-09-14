import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_zen/src/constants/colors.dart';
import 'package:to_do_zen/src/widgets/snackbar_alert.dart';

enum AuthError {
  userNotFound,
  invalidCredentials,
  invalidPassword,
  tooManyRequests,
  unknownError
}

extension AuthErrorExtension on AuthError {
  String get message {
    switch (this) {
      case AuthError.userNotFound:
        return 'No user exists for that email';
      case AuthError.invalidCredentials:
        return 'Invalid email or password';
      case AuthError.invalidPassword:
        return 'Invalid password';
      case AuthError.tooManyRequests:
        return 'too many failed login attempts. Try again later';
      case AuthError.unknownError:
        return 'Unknown error occurred';
      default:
        return 'Unknown error occurred';
    }
  }
}

class AuthException implements Exception {
  final String message;

  AuthException(this.message);

  @override
  String toString() {
    return "AuthException: $message";
  }

  // handle login related errors
  String? loginException() {
    if (message.contains('INVALID_LOGIN_CREDENTIALS')) {
      return AuthError.invalidCredentials.message;
    } else if (message.contains('user-not-found')) {
      return AuthError.userNotFound.message;
    } else if (message.contains('wrong-password')) {
      return AuthError.invalidPassword.message;
    } else if (message.contains('too-many-requests')) {
      return AuthError.tooManyRequests.message;
    } else {
      return AuthError.tooManyRequests.message;
    }
  }

  void registerException() {}
}
