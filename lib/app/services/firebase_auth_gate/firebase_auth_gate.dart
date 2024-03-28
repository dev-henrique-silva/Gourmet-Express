import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gourmetexpress/app/cubits/home/home_cubit.dart';
import 'package:gourmetexpress/app/cubits/login/login_cubit.dart';
import 'package:gourmetexpress/app/views/home_view.dart';
import 'package:gourmetexpress/app/views/login_view.dart';
import 'package:gourmetexpress/app_inject.dart';

class FirebaseAuthGate extends StatelessWidget {
  const FirebaseAuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            return HomeView(
              homeCubit: getIt<HomeCubit>(),
            );
          } else {
            return LoginView(
              loginCubit: getIt<LoginCubit>(),
            );
          }
        },
      ),
    );
  }
}
