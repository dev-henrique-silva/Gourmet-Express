import 'package:flutter/material.dart';
import 'package:gourmetexpress/app/models/addon_model.dart';
import 'package:gourmetexpress/app/models/cart_item_model.dart';
import 'package:gourmetexpress/app/models/food_model.dart';
import 'package:gourmetexpress/app/navigation/navigation_custom.dart';
import 'package:gourmetexpress/app/utils/args/food_details_args.dart';

mixin NavigationMixin {
  NavigationCustom navigationCustom = NavigationCustom();

  void goToRegisterAccountPage(BuildContext context) {
    navigationCustom.navigate(context, '/register_account');
  }

  void goToLoginPage(BuildContext context,
      {bool replace = false, bool pushAndRemoveUntil = false}) {
    navigationCustom.navigate(context, '/login',
        replace: replace, pushAndRemoveUntil: pushAndRemoveUntil);
  }

  void goToHomePage(
    BuildContext context, {
    String? uid,
    bool replace = false,
  }) {
    navigationCustom.navigate(context, '/home',
        replace: replace, arguments: uid);
  }

  void goToFoodDetailsPage(
    BuildContext context, {
    required FoodModel food,
    String? uid,
    bool cameByCartPage = false,
    List<AddonModel>? selectedAddons,
    CartItemModel? cartItem,
  }) {
    navigationCustom.navigate(
      context,
      '/food_details',
      arguments: FoodDetailsArgs(
        food: food,
        uid: uid,
        cartItem: cartItem,
        cameByCartPage: cameByCartPage,
        selectedAddons: selectedAddons,
      ),
    );
  }

  void goToCartPage(BuildContext context, String? uid, {bool replace = false}) {
    navigationCustom.navigate(context, '/cart',
        arguments: uid, replace: replace);
  }

  void goToContactPage(BuildContext context) {
    navigationCustom.navigate(context, '/contact');
  }

  goToPaymentPage(BuildContext context) {
    navigationCustom.navigate(context, '/payment');
  }
}
