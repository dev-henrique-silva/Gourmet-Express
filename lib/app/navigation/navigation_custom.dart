import 'package:flutter/material.dart';

class NavigationCustom {
  void navigate(BuildContext context, String route,
      {bool replace = false,
      bool pushAndRemoveUntil = false,
      Object? arguments}) {
    if (replace) {
      Navigator.pushReplacementNamed(context, route, arguments: arguments);
    } else if (pushAndRemoveUntil) {
      Navigator.pushNamedAndRemoveUntil(context, route, (route) => false,
          arguments: arguments);
    } else {
      Navigator.pushNamed(context, route, arguments: arguments);
    }
  }
}
