mixin FormValidator {
  static bool validateName(String value) {
    if (value.isEmpty) {
      return false;
    }
    return true;
  }

  static bool validateEmail(String value) {
    if (value.isEmpty) {
      return false;
    }
    // Regex for email validation
    const String p = '[a-zA-Z0-9+._%-+]{1,256}'
        '\\@'
        '[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}'
        '('
        '\\.'
        '[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}'
        ')+';
    final RegExp regExp = RegExp(p);
    if (regExp.hasMatch(value)) {
      return true;
    }
    return false;
  }

  static bool validatePassword(String value) {
    if (value.isEmpty) {
      return false;
    }
    // Use any password length of your choice here
    if (value.length < 5) {
      return false;
    }

    return true;
  }

  static bool isNumeric({String? s}) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }
}
