import 'package:flutter/material.dart';
import 'package:gourmetexpress/app/controllers/home_controller.dart';
import 'package:gourmetexpress/app/cubits/home/home_cubit.dart';
import 'package:gourmetexpress/app/cubits/login/login_cubit.dart';
import 'package:gourmetexpress/app/cubits/register_account/register_account_cubit.dart';
import 'package:gourmetexpress/app/views/home_view.dart';
import 'package:gourmetexpress/app/views/login_view.dart';
import 'package:gourmetexpress/app/views/register_view.dart';
import 'package:gourmetexpress/app_inject.dart';

final Map<String, WidgetBuilder> routes = {
  '/register_account': (context) =>
      RegisterView(registerCubit: getIt<RegisterAccountCubit>()),
  '/login': (context) => LoginView(loginCubit: getIt<LoginCubit>()),
  '/home': (context) => HomeView(
        homeCubit: getIt<HomeCubit>(),
        homeController: getIt<HomeController>(),
      ),
};
