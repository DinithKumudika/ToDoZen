enum LoginError {
  userNotFound,
  invalidCredentials,
  invalidPassword,
  tooManyRequests,
  unknownError
}

extension LoginErrorExtension on LoginError {
  String get message {
    switch (this) {
      case LoginError.userNotFound:
        return 'No user exists for that email';
      case LoginError.invalidCredentials:
        return 'Invalid email or password';
      case LoginError.invalidPassword:
        return 'Invalid password';
      case LoginError.tooManyRequests:
        return 'too many failed login attempts. Try again later';
      case LoginError.unknownError:
        return 'Unknown error occurred';
      default:
        return 'Unknown error occurred';
    }
  }
}