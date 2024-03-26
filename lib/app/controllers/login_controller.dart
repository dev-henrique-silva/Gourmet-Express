import 'package:firebase_auth/firebase_auth.dart';
import 'package:gourmetexpress/app/services/firebase_auth/firebase_auth_service.dart';
import 'package:gourmetexpress/app/services/firebase_auth/i_firebase_auth_service.dart';

class LoginController {
  final IFirebaseAuthService _firebaseAuthService;

  LoginController({required FirebaseAuthService firebaseAuthService})
      : _firebaseAuthService = firebaseAuthService;

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    if (email.isEmpty || password.isEmpty) return false;

    try {
      User? user = await _firebaseAuthService.signInWithEmailAndPassword(
        email,
        password,
      );

      return user != null ? true : false;
    } catch (e) {
      return false;
    }
  }
}
