import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gourmetexpress/app/services/firebase_auth/i_firebase_auth_service.dart';

class FirebaseAuthService implements IFirebaseAuthService {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthService({required FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth;

  @override
  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } catch (e) {
      debugPrint('Erro ao criar usuário');
    }

    return null;
  }

  @override
  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } catch (e) {
      debugPrint('Erro ao fazer login');
    }

    return null;
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
