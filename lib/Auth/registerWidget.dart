import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'authService.dart';

class RegisterWidget extends StatefulWidget {

  final Function(int) updateAuthState;
  const RegisterWidget({super.key, required this.updateAuthState});

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {

  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();

  String mail = '';
  String password = '';
  String name = '';
  String age = '0';
  String gender = '';
  String preference = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0.0,
        title: Text('DamApp Register Form',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            widget.updateAuthState(0);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
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
                            validator: (value){
                              if (value!.isEmpty) {
                                return 'Please enter your email';
                              }
                              if((!value.contains("@")) || (!value.contains("."))){
                                return "Please enter a valid email adress";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: 'Enter Mail',
                            ),
                            onChanged: (value) {
                              setState(() => mail = value);
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
                            validator: (value) => value!.length < 6 ? 'Please make a sure that your password is longer than 6 characters' : null,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              labelText: 'Enter Password',
                            ),
                            onChanged: (value) {
                              setState(() => password = value);
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
                            validator: (value) => value!.isEmpty ? 'Enter a name' : null,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              labelText: 'Enter Name',
                            ),
                            onChanged: (value) {
                              setState(() => name = value);
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
                            validator: (value) => value!.isEmpty ? 'Enter an age' : null,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Enter Age',
                            ),
                            onChanged: (value) {
                              setState(() => age = value);
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
                          DropdownButtonFormField<String>(
                            validator: (value) => value == null ? 'Select your gender' : null,
                            decoration: InputDecoration(
                              labelText: 'Select Gender',
                            ),
                            items: ['Female', 'Male', 'Other'].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                gender = value!;
                              });
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
                          DropdownButtonFormField<String>(
                            validator: (value) => value == null ? 'Select your Preference' : null,
                            decoration: InputDecoration(
                              labelText: 'Select Your Preference',
                            ),
                            items: ['Female', 'Male','Other'].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                preference = value!;
                              });
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
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50,
          padding: EdgeInsets.symmetric(),
          child: ElevatedButton(
            onPressed: () async {
              if(_formKey.currentState!.validate() ){

                widget.updateAuthState(2);
                Map<String, dynamic> userInfoMap = {
                  'name': name,
                  'age': age,
                  'gender': gender,
                  'preference': preference,
                };

                dynamic result = await _auth.createUserWithEmailAndPassword(mail, password, userInfoMap);
                widget.updateAuthState(1);
              }
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
}

