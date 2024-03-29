import 'package:firebase_auth/firebase_auth.dart';
import 'package:gourmetexpress/app/services/firebase_auth/i_firebase_auth_service.dart';
import 'package:gourmetexpress/app/services/local_storage_service/i_local_storage_service.dart';

class LoginController {
  final IFirebaseAuthService _firebaseAuthService;
  final ILocalStorageService _localStorageService;

  LoginController({
    required IFirebaseAuthService firebaseAuthService,
    required ILocalStorageService localStorageService,
  })  : _firebaseAuthService = firebaseAuthService,
        _localStorageService = localStorageService;

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

      if (user != null) {
        await _localStorageService.saveUidToLocalStorage(user.uid);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
