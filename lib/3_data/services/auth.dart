import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth auth = FirebaseAuth.instance;
  Future<UserCredential> signInWithEmailAndPassword(String email, String password) async {
   return  auth.signInWithEmailAndPassword(email: email, password: password);
  }

  void signOut() async {
    await auth.signOut();
  }
}
