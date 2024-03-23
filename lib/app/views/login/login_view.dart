import 'package:flutter/material.dart';
import 'package:gourmetexpress/app/components/custom_button.dart';
import 'package:gourmetexpress/app/components/custom_textfiel.dart';
import 'package:gourmetexpress/app/utils/images_assets/images_assets.dart';
import 'package:gourmetexpress/app/utils/strings/login_string.dart';

class LoginView extends StatefulWidget {
  final void Function()? onPressed;

  const LoginView({
    super.key,
    required this.onPressed,
  });

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  ImagesAssets.logoWithName,
                  width: 150,
                  height: 150,
                ),
                const SizedBox(height: 5),
                Text(
                  LoginString.logouPediuChegou.texto,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 25),
                CustomTextField(
                  controller: emailController,
                  hintText: LoginString.email.texto,
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: passwordController,
                  hintText: LoginString.senha.texto,
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                CustomButton(
                  text: LoginString.entrar.texto,
                  onPressed: () {},
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      LoginString.naoTemUmaConta.texto,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: widget.onPressed,
                      child: Text(
                        LoginString.cadastreSe.texto,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
