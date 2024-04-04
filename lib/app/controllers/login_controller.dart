import 'package:firebase_auth/firebase_auth.dart';
import 'package:gourmetexpress/app/services/firebase_auth/i_firebase_auth_service.dart';
import 'package:gourmetexpress/app/utils/strings/app_string.dart';

class LoginController {
  final IFirebaseAuthService _firebaseAuthService;

  LoginController({
    required IFirebaseAuthService firebaseAuthService,
  }) : _firebaseAuthService = firebaseAuthService;

  Future<String> login({
    required String email,
    required String password,
  }) async {
    if (email.isEmpty || password.isEmpty) return AppString.textVazio.texto;

    try {
      User? user = await _firebaseAuthService.signInWithEmailAndPassword(
        email,
        password,
      );

      if (user != null) {
        return user.uid;
      } else {
        return AppString.textVazio.texto;
      }
    } catch (e) {
      return AppString.textVazio.texto;
    }
  }
}
