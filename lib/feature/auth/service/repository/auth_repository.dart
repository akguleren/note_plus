import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_plus/app/constant/hive_key.dart';
import 'package:note_plus/app/init/navigation/navigation_route.dart';
import 'package:note_plus/app/utility/snackbar.dart';
import 'package:note_plus/main.dart';
import 'package:note_plus/feature/auth/login/model/auth_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

@riverpod
AuthRepository authRepository(Ref ref) => AuthRepositoryImpl();

abstract class AuthRepository {
  Future<UserCredential> login(AuthModel payload);
  Future<void> logout();
  Future<UserCredential?> signUp(AuthModel payload);
  Future<void> sendPasswordResetEmail(String email);
}

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<UserCredential> login(AuthModel payload) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: payload.email,
        password: payload.password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          throw Exception('No user found for that email.');
        case 'wrong-password':
          throw Exception('Wrong password provided for that user.');
        case 'user-disabled':
          throw Exception('This user account has been disabled.');
        case 'too-many-requests':
          throw Exception('Too many failed login attempts. Please try again later.');
        case 'invalid-email':
          throw Exception('The email address is not valid.');
        default:
          throw Exception('Login failed: ${e.message}');
      }
    } catch (e) {
      throw Exception('An unexpected error occurred: $e');
    }
  }

  @override
  Future<void> logout() async {
    try {
      await _firebaseAuth.signOut();
      await HiveKey.token.delete;
      appRouter.replaceAll([const LoginRoute()]);
    } catch (e) {
      throw Exception('Logout failed: $e');
    }
  }

  @override
  Future<UserCredential?> signUp(AuthModel payload) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: payload.email,
        password: payload.password,
      );

      return userCredential;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'weak-password':
          SnackbarUtils.showErrorSnackbar('The password provided is too weak.');
        case 'email-already-in-use':
          SnackbarUtils.showErrorSnackbar('The account already exists for that email.');
        case 'invalid-email':
          SnackbarUtils.showErrorSnackbar('The email address is not valid.');
        default:
          SnackbarUtils.showErrorSnackbar('Sign up failed: ${e.message}');
          rethrow;
      }
    } catch (e) {
      SnackbarUtils.showErrorSnackbar('An unexpected error occurred: $e');
      rethrow;
    }
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          SnackbarUtils.showErrorSnackbar('No user found for that email address.');
        case 'invalid-email':
          SnackbarUtils.showErrorSnackbar('The email address is not valid.');
        default:
          SnackbarUtils.showErrorSnackbar('Password reset failed: ${e.message}');
      }
    } catch (e) {
      SnackbarUtils.showErrorSnackbar('An unexpected error occurred: $e');
    }
  }
}
