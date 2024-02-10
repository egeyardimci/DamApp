import 'package:flutter/cupertino.dart';

import '../Auth/authService.dart';
import '../Database/userDatabase.dart';
import '../Models/userModel.dart';

class myUserProvider with ChangeNotifier {

  myUser? userobj;

  AuthService authService = AuthService();

  Future<myUserProvider?> setUser () async{

    Map<String, dynamic>? map = await userDatabase(uid: AuthService().currentUser!.uid).getUserDataAsMap();
    userobj = myUser.fromMap(map);
    notifyListeners();

    return this;
  }

  Future<void> updateUserData() async{
    await setUser();
    notifyListeners();
  }

  myUser? get currentUser{
    return userobj;
  }

}

