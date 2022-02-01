import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';

class AuthService {
  final Logger logger = Logger();
  final FirebaseAuth _instance = FirebaseAuth.instance;

  Future<UserCredential> login({String? email, String? password}) async {
    try {
      UserCredential loginResult = await _instance.signInWithEmailAndPassword(
          email: email.toString(), password: password.toString());

      return loginResult;
    } on FirebaseAuthException catch (e) {
      logger.e("error", e.message, e.stackTrace);
      throw e.message.toString();
    }
  }

  Future<UserCredential> signUp({String? email, String? password}) async {
    try {
      final newUser = await _instance.createUserWithEmailAndPassword(
          email: email.toString(), password: password.toString());

      return newUser;
    } on FirebaseAuthException catch (e) {
      logger.e("error", e.message, e.stackTrace);
      throw e.message.toString();
    }
  }

  Future<void> logout() async {
    try {
      await _instance.signOut();
    } on FirebaseAuthException catch (e) {
      logger.e("error", e.message, e.stackTrace);
      throw e.message.toString();
    }
  }
}
