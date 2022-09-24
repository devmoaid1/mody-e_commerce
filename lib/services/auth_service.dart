import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';

class AuthService extends BaseViewModel {
  final Logger logger = Logger();
  final FirebaseAuth _instance = FirebaseAuth.instance;

  User? _currentUser;

  bool _isLoggedIn = false;

  User? get currentUser => _currentUser;
  bool get isLoggedIn => _isLoggedIn;

  Future<UserCredential> login({String? email, String? password}) async {
    try {
      UserCredential loginResult = await _instance.signInWithEmailAndPassword(
          email: email.toString(), password: password.toString());
      _isLoggedIn = true;

      notifyListeners();
      return loginResult;
    } on FirebaseAuthException catch (e) {
      logger.e("error", e.message, e.stackTrace);
      _isLoggedIn = false;
      notifyListeners();
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
      _isLoggedIn = false;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      logger.e("error", e.message, e.stackTrace);
      throw e.message.toString();
    }
  }

  User? getCurrentUser() {
    _instance.authStateChanges().listen((user) {
      if (user != null) {
        _currentUser = user;
        _isLoggedIn = true;
        logger.i(currentUser);
      } else {
        _isLoggedIn = false;
      }
    }).onError((err) {
      logger.e(err.toString(), "error in getting current user");
    });
    notifyListeners();
    return _currentUser;
  }
}
