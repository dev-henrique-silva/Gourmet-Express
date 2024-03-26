extension EmailValidator on String {
  bool get isValidEmail {
    RegExp emailRegex = RegExp(
        r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');
    return emailRegex.hasMatch(this);
  }

  bool get isValidPassword {
    return length >= 6;
  }
}
