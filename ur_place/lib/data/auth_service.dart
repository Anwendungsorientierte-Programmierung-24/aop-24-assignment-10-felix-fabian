import "package:firebase_auth/firebase_auth.dart";
import "package:firebase_core/firebase_core.dart";
import "package:flutter/foundation.dart";

class AuthService extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;
  FirebaseApp get currentApp => _firebaseAuth.app;
  

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<UserCredential> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential;
    } on FirebaseAuthException catch (error) {
      throw Exception(error.code);
    }
  }

  String test() {
    return "Test";
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
  
  // TODO(aleksicf): Implement these methods.
  // createUserWithEmailAndPassword(email, password)
  // signOut()
  // Logout
  // sendPasswordResetEmail(email)
}
