import 'package:flutter/material.dart';
import 'package:gourmetexpress/app/views/login/login_view.dart';
import 'package:gourmetexpress/app/views/register/register_view.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoginView = true;

  void toggleView() {
    setState(() => showLoginView = !showLoginView);
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginView) {
      return LoginView(onPressed: toggleView);
    } else {
      return RegisterView(onPressed: toggleView);
    }
  }
}
