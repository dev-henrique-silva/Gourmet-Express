import 'package:firebase_auth/firebase_auth.dart';
import 'package:gourmetexpress/app/services/firebase_auth/firebase_auth_service.dart';
import 'package:gourmetexpress/app/services/firebase_auth/i_firebase_auth_service.dart';
import 'package:gourmetexpress/app/utils/extensions/string_extensions.dart';

class RegisterAccountController {
  final IFirebaseAuthService _firebaseAuthService;

  RegisterAccountController({required FirebaseAuthService firebaseAuthService})
      : _firebaseAuthService = firebaseAuthService;

  Future<bool> registerAccount({
    required String email,
    required String password,
  }) async {
    if (!email.isValidEmail || !password.isValidPassword) return false;

    try {
      User? user = await _firebaseAuthService.signUpWithEmailAndPassword(
        email,
        password,
      );

      return user != null ? true : false;
    } catch (e) {
      return false;
    }
  }
}
