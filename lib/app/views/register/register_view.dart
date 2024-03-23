import 'package:flutter/material.dart';
import 'package:gourmetexpress/app/components/custom_button.dart';
import 'package:gourmetexpress/app/components/custom_textfiel.dart';
import 'package:gourmetexpress/app/utils/images_assets/images_assets.dart';
import 'package:gourmetexpress/app/utils/strings/register_string.dart';

class RegisterView extends StatefulWidget {
  final void Function()? onPressed;

  const RegisterView({
    super.key,
    required this.onPressed,
  });

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: SingleChildScrollView(
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
                RegisterString.crieSuaContaEAproveite.texto,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 25),
              CustomTextField(
                controller: emailController,
                hintText: RegisterString.email.texto,
              ),
              const SizedBox(height: 10),
              CustomTextField(
                controller: passwordController,
                hintText: RegisterString.senha.texto,
                obscureText: true,
              ),
              const SizedBox(height: 10),
              CustomTextField(
                controller: confirmController,
                hintText: RegisterString.confirarSenha.texto,
                obscureText: true,
              ),
              const SizedBox(height: 10),
              CustomButton(
                text: RegisterString.criarConta.texto,
                onPressed: () {},
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    RegisterString.jaPossuiUmaConta.texto,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: widget.onPressed,
                    child: Text(
                      RegisterString.voltarParaOLogin.texto,
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
    );
  }
}
