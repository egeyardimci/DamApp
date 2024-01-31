import 'package:agaol/Auth/loginWidget.dart';
import 'package:agaol/Auth/registerWidget.dart';
import 'package:agaol/loadingWidget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:agaol/Auth/authService.dart';


class AuthWrapper extends StatefulWidget {
  AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {

  AuthService _auth = AuthService();
  int auth_state = 0; // 0->LOGIN, 1->REGISTER, 2->LOADING, 3->SIGN-IN ERROR,

  void _updateAuthState(int newState) {
    setState(() {
      auth_state = newState;
    });
  }


  @override
  Widget build(BuildContext context) {
    if(auth_state == 0){
      return LoginWidget(updateAuthState: _updateAuthState,authStage: 0,);
    }
    else if(auth_state ==1) {
      return RegisterWidget(updateAuthState: _updateAuthState);
    }
    else if(auth_state ==2){
      return LoadingWidget();
    }
    else if(auth_state == 3){
      return LoginWidget(updateAuthState: _updateAuthState,authStage: 3,);
    }
    else {
      return LoginWidget(updateAuthState: _updateAuthState,authStage: auth_state,);;
    }
  }
}

