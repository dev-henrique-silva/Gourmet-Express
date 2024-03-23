import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gourmetexpress/app/themes/custom_theme.dart';
import 'package:gourmetexpress/app/views/splash_screen/splash_screen_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gourmet Express',
      theme: customTheme,
      home: const SplashScreenView(),
    );
  }
}
