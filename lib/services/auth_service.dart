import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // make an object from FirebaseAuth.instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // login
  Future<UserCredential> logIn({
    required String email,
    required String password,
  }) async {
    return await _auth.signInWithEmailAndPassword(
      email: email.trim(),
      password: password,
    );
  }

  // Create a new user account
  Future<UserCredential> signUp({
    required String email,
    required String password,
  }) async {
    return await _auth.createUserWithEmailAndPassword(
      email: email.trim(),
      password: password,
    );
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
