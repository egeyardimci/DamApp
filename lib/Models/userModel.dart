
import 'package:agaol/Auth/authService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../Database/userDatabase.dart';

class myUser{
  String? name = "";
  String? age = "";
  String? gender = "";
  String? preference = "";
  String? about = "";

  myUser({this.name,this.age,
    this.gender, this.preference, this.about});

}

class myUserProvider with ChangeNotifier {

  myUser? userobj;


  AuthService authService = AuthService();

  myUser? convertUser(Map<String, dynamic>? userdata){
    myUser? _user = myUser(name: userdata?["name"], age: userdata?["age"], gender: userdata?["gender"],
        preference: userdata?["preference"], about: userdata?["about"]);
    return(_user);
  }

  Future<myUser?> setUser () async{
    print("saga");
    DocumentSnapshot<Object?>? snapshot = await userDatabase(uid: authService.currentUser!.uid).currentUser;
    Map<String, dynamic>? map = snapshot?.data() as Map<String, dynamic>?;

    userobj = convertUser(map);
    notifyListeners();
    return userobj;
  }

  Future<void> updateUserData() async{
    await setUser();
    notifyListeners();
  }

  myUser? get currentUser{
    return this.userobj;
  }

}

