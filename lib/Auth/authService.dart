import 'package:firebase_auth/firebase_auth.dart';

class myUser{
  String displayName = "";

  myUser(dynamic name){
    if(name == null){
      displayName = "";
    }
    else{
      displayName = name;
    }
  }
}

class AuthService{
  FirebaseAuth _auth = FirebaseAuth.instance;

  myUser? convertUser(User? user){
    if(user == null){
      return null;
    }
    else {
      return myUser(user.displayName);
    }
  }

  Future<UserCredential> signInAnon() async{
    UserCredential fb_user = await _auth.signInAnonymously();
    return fb_user;
  }

  Stream<myUser?> get user{
    return _auth.authStateChanges().map((User? user) => convertUser(user));
  }

  Future<void> signOut(){
    return _auth.signOut();
  }

}