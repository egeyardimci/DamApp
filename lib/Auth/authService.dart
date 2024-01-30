import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> signInAnon() async{
    UserCredential fb_user = await _auth.signInAnonymously();
    return fb_user;
  }

}