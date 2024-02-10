import 'package:agaol/Database/requestDatabase.dart';
import 'package:agaol/Database/userDatabase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:agaol/Database/requestDatabase.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signInAnon() async{
    try {
      UserCredential fb_user = await _auth.signInAnonymously();
      return fb_user.user;
    }catch(e){
      return null;
    }
  }

  Future<User?> createUserWithEmailAndPassword (String email, String password,
      Map<String, dynamic> userInfoMap) async {
    try {
      //Create new user
      UserCredential fb_user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = fb_user.user;

      //Update the user data with taken user information
      await userDatabase(uid: user!.uid).updateUserData(userInfoMap);
      return user;
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  Future<User?> signInWithEmailAndPassword (String email,String password) async{
      try {
        UserCredential fb_user = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        User? user = fb_user.user;

        return user;
      }catch(e){
        return null;
      }


  }

  Stream<User?> get user{
    return _auth.authStateChanges();
  }

  User? get currentUser{
    return _auth.currentUser;
  }

  Future<void>? signOut(){
    try {
      return _auth.signOut();
    }catch(e){
      print("Error Signin Out!");
      return null;
    }
  }

}