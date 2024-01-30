import 'package:agaol/Auth/loginWidget.dart';
import 'package:agaol/loading.dart';
import 'package:flutter/material.dart';

class AuthWrapper extends StatefulWidget {
  AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  int authStage = 0;

  @override
  Widget build(BuildContext context) {
    if(authStage == 0){
      return SafeArea(child: LoginWidget());
    }
    else if(authStage == 1){
      //return register widget
    }
    else if(authStage == 2){
      return SafeArea(child: LoadingWidget());
    }
    return SafeArea(child: LoginWidget());
  }
}
