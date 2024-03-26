import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class FlushbarSuccessWidget {
  final String title;
  final String message;
  final Duration? duration;
  final BuildContext context;
  final OnTap? onTap;

  FlushbarSuccessWidget({
    required this.context,
    required this.title,
    required this.message,
    this.duration,
    this.onTap,
  }) {
    Flushbar(
      titleText: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w800,
          color: Theme.of(context).colorScheme.tertiary,
        ),
      ),
      messageText: Text(
        message,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w800,
          color: Theme.of(context).colorScheme.tertiary,
        ),
      ),
      messageColor: Theme.of(context).colorScheme.tertiary,
      duration: duration ?? const Duration(seconds: 5),
      isDismissible: true,
      flushbarPosition: FlushbarPosition.TOP,
      margin: const EdgeInsets.all(6.0),
      padding: const EdgeInsets.all(20),
      borderRadius: BorderRadius.circular(10),
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      icon: Icon(
        Icons.check_circle,
        color: Theme.of(context).colorScheme.tertiary,
      ),
      onTap: onTap,
    ).show(context);
  }
}
