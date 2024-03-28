import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gourmetexpress/app/components/custom_button.dart';
import 'package:gourmetexpress/app/components/custom_textfiel.dart';
import 'package:gourmetexpress/app/components/flushbar/flushbar_error_widget.dart';
import 'package:gourmetexpress/app/components/flushbar/flushbar_success_widget.dart';
import 'package:gourmetexpress/app/cubits/register_account/register_account_cubit.dart';
import 'package:gourmetexpress/app/navigation/Navigation_mixin.dart';
import 'package:gourmetexpress/app/utils/images_assets/images_assets.dart';
import 'package:gourmetexpress/app/utils/strings/app_string.dart';
import 'package:gourmetexpress/app/utils/strings/register_string.dart';

class RegisterView extends StatefulWidget {
  final RegisterAccountCubit registerCubit;

  const RegisterView({
    super.key,
    required this.registerCubit,
  });

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> with NavigationMixin {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();

  RegisterAccountCubit get registerCubit => widget.registerCubit;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    registerCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterAccountCubit, RegisterAccountState>(
        bloc: registerCubit,
        listener: (context, state) {
          if (state is RegisterSuccess) {
            Future.delayed(
              Duration.zero,
              () => FlushbarSuccessWidget(
                context: context,
                title: AppString.sucesso.texto,
                message: RegisterString.contaCriadaComSucesso.texto,
              ),
            );

            goToLoginPage(context, replace: true);
          } else if (state is RegisterFailure) {
            FlushbarErrorWidget(
              context: context,
              title: AppString.erro.texto,
              message: state.message,
            );
          }
        },
        builder: (context, state) {
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
                      hintText: AppString.email.texto,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: passwordController,
                      hintText: AppString.senha.texto,
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
                      isLoading: state is RegisterLoading,
                      onPressed: () {
                        registerCubit.registerAccount(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                      },
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
                          onTap: () => Navigator.pop(context),
                          child: Text(
                            RegisterString.voltarParaOLogin.texto,
                            style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
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
        });
  }
}
