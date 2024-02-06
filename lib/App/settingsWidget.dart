import 'package:agaol/Auth/authService.dart';
import 'package:agaol/Models/userModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:agaol/App/bottomBarWidget.dart';
import 'package:agaol/App/topBarWidget.dart';
import "package:provider/provider.dart";
import 'package:agaol/Database/userDatabase.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({super.key});

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  String preference = "";
  String gender = "";
  String age = "";
  String name = "";

  final AuthService _auth = AuthService();

  @override

  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {

    final User? user = Provider.of<User?>(context);

    return Scaffold(
      appBar: TopBarWidget(title: 'DamApp',),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
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
                              controller: _nameController,
                              validator: (value) => value!.isEmpty ? 'Update Your Name' : null,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                icon: Icon(Icons.person),
                                labelText: 'Update Your Name',
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
                              controller: _ageController,
                              validator: (value) => value!.isEmpty ? 'Update Your Age' : null,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                icon: Icon(Icons.timelapse_sharp),
                                labelText: 'Update Your Age',
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
                              validator: (value) => value == null ? 'Update your gender' : null,
                              decoration: InputDecoration(
                                icon: Icon(Icons.transgender),
                                labelText: 'Update Your Gender',
                              ),
                              items: ['Female', 'Male','Other'].map((String value) {
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
                            )
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
                                icon: Icon(Icons.supervised_user_circle_sharp),
                                labelText: 'Update Your Preference',
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
              Consumer<myUserProvider>(builder: (context,_user,child){
                return ElevatedButton(
                  onPressed: ()  async {

                    if (gender.isNotEmpty ) {
                      await userDatabase(uid: user!.uid).updateSingleUserData("gender", gender);
                    }
                    if (age.isNotEmpty ) {
                      await userDatabase(uid: user!.uid).updateSingleUserData("age", age);
                    }
                    if (name.isNotEmpty ) {
                      await userDatabase(uid: user!.uid).updateSingleUserData("name", name);
                    }
                    if (preference.isNotEmpty) {
                      await userDatabase(uid: user!.uid).updateSingleUserData("preference", preference);
                    }


                    if(gender.isEmpty && age.isEmpty && name.isEmpty && preference.isEmpty) {

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Changes are not selected"),
                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                    else {
                      print("aga");
                      await _user.updateUserData();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Changes Saved'),
                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.green,
                        ),
                      );
                    }
                    setState(() {
                      gender = "";
                      age = "";
                      name = "";
                      preference = "";
                      _nameController.text = "";
                      _ageController.text = "";
                    });

                  },
                  child: Text("Save Changes"),
                );
              })
              ],
            ),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  await _auth.signOut();
                },
                child: Text("Log Out"),
              ),
            ),


          ]
      ),
      bottomNavigationBar: BottomBarWidget(),
    );
  }
}