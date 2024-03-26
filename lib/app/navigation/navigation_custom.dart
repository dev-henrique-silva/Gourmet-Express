import 'package:flutter/material.dart';

class NavigationCustom {
  void navigate(BuildContext context, String route,
      {bool replace = false, bool pushAndRemoveUntil = false}) {
    if (replace) {
      Navigator.pushReplacementNamed(context, route);
    } else if (pushAndRemoveUntil) {
      Navigator.pushNamedAndRemoveUntil(context, route, (route) => false);
    } else {
      Navigator.pushNamed(context, route);
    }
  }
}
