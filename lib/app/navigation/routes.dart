import 'package:flutter/material.dart';
import 'package:gourmetexpress/app/controllers/cart_controller.dart';
import 'package:gourmetexpress/app/controllers/food_details_controller.dart';
import 'package:gourmetexpress/app/controllers/home_controller.dart';
import 'package:gourmetexpress/app/cubits/home/home_cubit.dart';
import 'package:gourmetexpress/app/cubits/login/login_cubit.dart';
import 'package:gourmetexpress/app/cubits/register_account/register_account_cubit.dart';
import 'package:gourmetexpress/app/models/food_model.dart';
import 'package:gourmetexpress/app/views/cart_view.dart';
import 'package:gourmetexpress/app/views/food_details_view.dart';
import 'package:gourmetexpress/app/views/home_view.dart';
import 'package:gourmetexpress/app/views/login_view.dart';
import 'package:gourmetexpress/app/views/register_account_view.dart';
import 'package:gourmetexpress/app_inject.dart';

final Map<String, WidgetBuilder> routes = {
  '/register_account': (context) =>
      RegisterAccountView(registerCubit: getIt<RegisterAccountCubit>()),
  '/login': (context) => LoginView(loginCubit: getIt<LoginCubit>()),
  '/home': (context) => HomeView(
        uid: ModalRoute.of(context)!.settings.arguments as String,
        homeCubit: getIt<HomeCubit>(),
        homeController: getIt<HomeController>(),
      ),
  '/food_details': (context) => FoodDetailsView(
        food: ModalRoute.of(context)!.settings.arguments as FoodModel,
        controller: getIt<FoodDetailsController>(),
      ),
  '/cart': (context) => CartView(
        uid: ModalRoute.of(context)!.settings.arguments as String,
        cartController: getIt<CartController>(),
      ),
};
