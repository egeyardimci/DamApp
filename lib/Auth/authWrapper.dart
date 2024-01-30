import 'package:agaol/Auth/registerWidget.dart';
import 'package:agaol/loading.dart';
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
  int auth_state = 0; // 0->LOGIN, 1->REGISTER, 2->LOADING

  void _updateAuthState(int newState) {
    setState(() {
      auth_state = newState;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(auth_state == 0){
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
            SizedBox(height: 10.0),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(),
              child: ElevatedButton(
                onPressed: () async {
                  setState(() {
                    auth_state = 2;
                  });
                  UserCredential user = await _auth.signInAnon();
                  print(user);
                  setState(() {
                    auth_state = 0;
                  });
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 18,
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
              onPressed: () {
                setState(() {
                  auth_state = 1;
                });
              },
              child: Text(
                'Register',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      );
    }
    else if(auth_state ==1) {
      return RegisterWidget(updateAuthState: _updateAuthState);
    }
    else {
      return LoadingWidget();
    }
  }
}
