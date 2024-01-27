import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:agaol/bottomBarWidget.dart';
import 'package:agaol/topBarWidget.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("",
          style: TextStyle(
            color: Colors.lightBlueAccent,
            letterSpacing: 1.5,
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.lightBlue[900],
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                radius: 50.0,
              ),
            ),
            Divider(
              height: 60.0,
              color: Colors.red,
            ),
            Text("Name:",
              style: TextStyle(
                color: Colors.red,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text("Age: ",
              style: TextStyle(
                color: Colors.red,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text("Gender:",
              style: TextStyle(
                color: Colors.red,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text("Dating Preferance:",
              style: TextStyle(
                color: Colors.red,
                letterSpacing: 1.5,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
