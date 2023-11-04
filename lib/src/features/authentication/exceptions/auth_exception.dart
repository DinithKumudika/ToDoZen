import 'package:to_do_zen/src/features/authentication/enums/login_error.dart';
import 'package:to_do_zen/src/features/authentication/enums/registration_errror.dart';

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
      return LoginError.invalidCredentials.message;
    } else if (message.contains('user-not-found')) {
      return LoginError.userNotFound.message;
    } else if (message.contains('wrong-password')) {
      return LoginError.invalidPassword.message;
    } else if (message.contains('too-many-requests')) {
      return LoginError.tooManyRequests.message;
    } else {
      return LoginError.unknownError.message;
    }
  }

  String? registrationException() {
    if (message.contains('weak-password')) {
      return RegistrationError.weakPassword.message;
    } else if (message.contains('email-already-in-use')) {
      return RegistrationError.emailInUse.message;
    }
    else if (message.contains('invalid-email')) {
      return RegistrationError.invalidEmail.message;
    }
    else if (message.contains('invalid-password')) {
      return RegistrationError.invalidPassword.message;
    }
    else if (message.contains('operation-not-allowed')) {
      return RegistrationError.notAllowed.message;
    }   
    else if (message.contains('too-many-requests')) {
      return RegistrationError.tooManyRequests.message;
    } 
    else {
      return RegistrationError.unknownError.message;
    }
  }
}
