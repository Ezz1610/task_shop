class Validations {
  static String? emailValidation(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return 'App.tr.emailEmpty';
    }
    if (!regex.hasMatch(value)) {
      return 'App.tr.validateEmail';
    } else {
      return null;
    }
  }

  bool isEmailValid(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  static String? passwordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return ' App.tr.passwordEmpty';
    }
    if (value.length < 8) {
      return 'App.tr.validatePassword';
    } else {
      return null;
    }
  }

  static String? userNameValidation(String? value) {
    if (value == null || value.isEmpty) {
      return ' App.tr.nameEmpty';
    }
    if (value.length < 4) {
      return 'App.tr.validateUserName';
    } else {
      return null;
    }
  }

  static String? userNumberValidation(String? value) {
    if (value == null || value.isEmpty) {
      return ' App.tr.nameEmpty';
    }
    if (value.length < 4) {
      return 'App.tr.validateUserNumber';
    } else {
      return null;
    }
  }

  static String? mobileValidation(String? value) {
    if (value == null || value.isEmpty) return 'مطلوب';
    if (value.length < 10) {
      return 'App.tr.validatePhone';
    } else {
      return null;
    }
  }

  static String? deviceValidation(String? value) {
    if (value == null || value.isEmpty) return 'مطلوب';
    return null;
  }
}
