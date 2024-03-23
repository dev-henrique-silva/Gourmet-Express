import 'package:flutter/material.dart';
import 'package:gourmetexpress/app/services/firebase_auth/firebase_auth_gate.dart';
import 'package:gourmetexpress/app/utils/images_assets/images_assets.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    super.initState();
    _navigateToLoginOrRegisterPage();
  }

  Future<void> _navigateToLoginOrRegisterPage() async {
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const AuthGate(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffededed),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Image.asset(ImagesAssets.logoWithName),
        ),
      ),
    );
  }
}
