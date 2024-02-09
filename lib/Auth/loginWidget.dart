import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'authService.dart';

class LoginWidget extends StatefulWidget {
  final Function(int) updateAuthState;
  int authStage;
  LoginWidget({super.key,required this.updateAuthState, required this.authStage});


  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final AuthService _auth = AuthService();

  void _validateSignForm() async{
    widget.updateAuthState(2);
    User? user = await _auth.signInWithEmailAndPassword(_emailController.text, _passwordController.text);
    if(user == null){
      widget.updateAuthState(3);
    }
  }

  @override
void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _showError("Invalid Credentials!"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0.0,
        title:  Text('DamApp',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
            )
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    child: Image(image: AssetImage("assets/damlogo.png")),
                  width: 200,
                  height: 200,
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
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: 'Enter Mail',
                              ),
                              controller: _emailController,
                              validator: (value){
                                if (value!.isEmpty) {
                                  return 'Please enter your email';
                                }
                                if((!value.contains("@")) || (!value.contains("."))){
                                  return "Please enter a valid email adress";
                                }
                                return null;
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
                              obscureText: true,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                labelText: 'Enter Password',
                              ),
                              controller: _passwordController,
                              validator: (value){
                                if (value!.isEmpty) {
                                  return 'Please enter your password';
                                }
                                if((value.length<6)){
                                  return 'Please make a sure that your password is longer than 6 characters';
                                }
                                return null;
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
                      if(_formKey.currentState!.validate()) {
                        _validateSignForm();
                      }
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
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50,
          padding: EdgeInsets.symmetric(),
          child: ElevatedButton(
            onPressed: () {
              widget.updateAuthState(1);
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

  void _showError(String errorMessage) {
    if(widget.authStage == 3) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          duration: Duration(seconds: 2), // Adjust the duration as needed
        ),
      );
    }
  }

}

