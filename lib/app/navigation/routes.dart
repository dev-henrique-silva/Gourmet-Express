import 'package:flutter/material.dart';
import 'package:gourmetexpress/app/controllers/cart_controller.dart';
import 'package:gourmetexpress/app/controllers/food_details_controller.dart';
import 'package:gourmetexpress/app/controllers/home_controller.dart';
import 'package:gourmetexpress/app/controllers/order_details_controller.dart';
import 'package:gourmetexpress/app/controllers/payment_controller.dart';
import 'package:gourmetexpress/app/cubits/home/home_cubit.dart';
import 'package:gourmetexpress/app/cubits/login/login_cubit.dart';
import 'package:gourmetexpress/app/cubits/register_account/register_account_cubit.dart';
import 'package:gourmetexpress/app/utils/args/food_details_args.dart';
import 'package:gourmetexpress/app/utils/args/payment_args.dart';
import 'package:gourmetexpress/app/views/cart_view.dart';
import 'package:gourmetexpress/app/views/contact_view.dart';
import 'package:gourmetexpress/app/views/food_details_view.dart';
import 'package:gourmetexpress/app/views/home_view.dart';
import 'package:gourmetexpress/app/views/login_view.dart';
import 'package:gourmetexpress/app/views/order_details_view.dart';
import 'package:gourmetexpress/app/views/payment_view.dart';
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
        foodDetailsArgs:
            ModalRoute.of(context)!.settings.arguments as FoodDetailsArgs,
        foodDetailsController: getIt<FoodDetailsController>(),
      ),
  '/cart': (context) => CartView(
        uid: ModalRoute.of(context)!.settings.arguments as String,
        cartController: getIt<CartController>(),
      ),
  '/payment': (context) => PaymentView(
        paymentArgs: ModalRoute.of(context)!.settings.arguments as PaymentArgs,
        paymentController: getIt<PaymentController>(),
      ),
  '/order_details': (context) => OrderDetailsView(
        uid: ModalRoute.of(context)!.settings.arguments as String,
        orderDetailsController: getIt<OrderDetailsController>(),
      ),
  '/contact': (context) => const ContactView(),
};
