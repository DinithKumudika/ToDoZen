enum RegistrationError {
  weakPassword,
  emailInUse,
  invalidEmail,
  invalidPassword,
  tooManyRequests,
  notAllowed,
  unknownError
}

extension RegistrationErrorExtension on RegistrationError {
  String get message {
    switch (this) {
      case RegistrationError.weakPassword:
        return 'Password must have at least 8 characters';
      case RegistrationError.emailInUse:
        return 'An account already exists with the provided email';
      case RegistrationError.invalidEmail:
        return 'Email is Invalid. check again!';
      case RegistrationError.invalidPassword:
        return 'Invalid password. Password must have at least 8 characters';
      case RegistrationError.tooManyRequests:
        return 'Too many failed login attempts. Try again later';
      case RegistrationError.notAllowed:
        return 'Operation Not allowed';
      case RegistrationError.unknownError:
        return 'Unknown error occurred';
      default:
        return 'Unknown error occurred';
    }
  }
}
