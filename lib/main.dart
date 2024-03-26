import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gourmetexpress/app/navigation/routes.dart';
import 'package:gourmetexpress/app/themes/custom_theme.dart';
import 'package:gourmetexpress/app/views/splash_screen_view.dart';
import 'package:gourmetexpress/app_inject.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      title: 'Gourmet Express',
      theme: customTheme,
      home: const SplashScreenView(),
    );
  }
}
