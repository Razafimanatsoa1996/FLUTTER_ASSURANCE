extension StringExtension on String {
  bool get isValidEmail {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9-]+\.[a-zA-Z]+")
        .hasMatch(this);
  }

  bool get isValidPhone {
    return length == 9;
  }
}
