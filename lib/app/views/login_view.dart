import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gourmetexpress/app/components/custom_button.dart';
import 'package:gourmetexpress/app/components/custom_textfiel.dart';
import 'package:gourmetexpress/app/components/flushbar/flushbar_error_widget.dart';
import 'package:gourmetexpress/app/cubits/login/login_cubit.dart';
import 'package:gourmetexpress/app/navigation/Navigation_mixin.dart';
import 'package:gourmetexpress/app/utils/images_assets/images_assets.dart';
import 'package:gourmetexpress/app/utils/strings/app_string.dart';
import 'package:gourmetexpress/app/utils/strings/login_string.dart';

class LoginView extends StatefulWidget {
  final LoginCubit loginCubit;

  const LoginView({
    super.key,
    required this.loginCubit,
  });

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with NavigationMixin {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginCubit get loginCubit => widget.loginCubit;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
        bloc: loginCubit,
        listener: (context, state) {
          if (state is LoginSuccess) {
            goToHomePage(context, replace: true);
          } else if (state is LoginFailure) {
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
                        hintText: AppString.email.texto,
                        obscureText: false,
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        controller: passwordController,
                        hintText: AppString.senha.texto,
                        obscureText: true,
                      ),
                      const SizedBox(height: 10),
                      CustomButton(
                        text: AppString.entrar.texto,
                        isLoading: state is LoginLoading,
                        onPressed: () {
                          loginCubit.login(
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
                            LoginString.naoTemUmaConta.texto,
                            style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                            ),
                          ),
                          const SizedBox(width: 5),
                          GestureDetector(
                            onTap: () => goToRegisterAccountPage(context),
                            child: Text(
                              LoginString.cadastreSe.texto,
                              style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
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
        });
  }
}
