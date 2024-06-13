import 'package:firebase_auth/firebase_auth.dart';
import 'package:tick_off/data/firestore.dart';

abstract class AuthenticationDataSource {
  Future<void> register(String email, String password, String passwordConfirm);
  Future<void> login(String email, String password);
}

class AuthenticationRemote extends AuthenticationDataSource {
  @override
  Future<void> login(String email, String password) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> register(
      String email, String password, String passwordConfirm) async {
    if (password != passwordConfirm) {
      throw Exception('Passwords do not match');
    }
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: email.trim(), password: password.trim())
        .then((value) {
      Firestore_Datasource().CreateUser(email);
    });
  }
}
