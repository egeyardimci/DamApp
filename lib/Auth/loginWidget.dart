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

  AuthService _auth = AuthService();
  int login_stage = 0; //0 : not logged in , 1 : loading , 2 : Success login
  // 3 : Not Success login

  @override
  Widget build(BuildContext context) {
    if(login_stage == 0){
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.red,
          elevation: 0.0,
          title: Text('LOGIN',
              style: TextStyle(
                  color: Colors.white
              )
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: 'Enter Mail',
                          ),
                          onChanged: (value) {
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Card(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            labelText: 'Enter Password',
                          ),
                          onChanged: (value) {
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 50,
            padding: EdgeInsets.symmetric(),
            child: ElevatedButton(
              onPressed: () async{
                setState(() {
                  login_stage = 1;
                });
                UserCredential user = await _auth.signInAnon();
                print(user);
                setState(() {
                  login_stage = 0;
                });

              },
              child: Text(
                'Continue',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      );
    }
    else{
      return LoadingWidget();
    }
  }
}