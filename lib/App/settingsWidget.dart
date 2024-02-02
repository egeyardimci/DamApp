import 'package:agaol/Auth/authService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:agaol/App/bottomBarWidget.dart';
import 'package:agaol/App/topBarWidget.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({super.key});

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBarWidget(title: 'DamApp',),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Card(
                child: Padding(
                  padding: EdgeInsets.symmetric(),
                  child: ExpansionTile(
                    title: ListTile(
                      leading: Icon(Icons.timelapse_sharp),
                      title: Text("Age"),
                    ),
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          children: [
                            TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'New Age',
                              ),
                              onChanged: (value) {
                                // Handle the minimum age input value
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.symmetric(),
                  child: ExpansionTile(
                    title: ListTile(
                      leading: Icon(Icons.transgender),
                      title: Text("Gender"),
                    ),
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          children: [
                            TextFormField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                labelText: 'New Gender',
                              ),
                              onChanged: (value) {
                                // Handle the minimum age input value
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.symmetric(),
                  child: ExpansionTile(
                    title: ListTile(
                      leading: Icon(Icons.supervised_user_circle_sharp),
                      title: Text("Preference"),
                    ),
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          children: [
                            TextFormField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                labelText: 'New Preference',
                              ),
                              onChanged: (value) {
                                // Handle the minimum age input value
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
