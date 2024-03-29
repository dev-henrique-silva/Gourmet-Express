import 'package:flutter/material.dart';
import 'package:gourmetexpress/app/navigation/navigation_custom.dart';

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
}
