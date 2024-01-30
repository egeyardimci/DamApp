import 'package:agaol/Auth/authService.dart';
import 'package:agaol/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {

  int login_stage = 0;
  AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    if(login_stage == 0) {
      return Scaffold(
        body: ElevatedButton(
          onPressed: () async {
            setState(() {
              login_stage = 1;
            });
            UserCredential user = await _auth.signInAnon();
            print(user);
            setState(() {
              login_stage = 0;
            });
          },
          child: Text("login"),
        ),
      );
    }
    else{
      return LoadingWidget();
    }
    return LoginWidget();
  }
}
