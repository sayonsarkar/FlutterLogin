class HelpersFunction {
  static bool isEmailValid(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(email);
  }

  static bool isPasswordValid(String password) {
    final minLength = RegExp(r'.{8,}');
    final specialChar = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
    final capitalLetter = RegExp(r'[A-Z]');
    final numericDigit = RegExp(r'[0-9]');

    return minLength.hasMatch(password) &&
        specialChar.hasMatch(password) &&
        capitalLetter.hasMatch(password) &&
        numericDigit.hasMatch(password);
  }
}
