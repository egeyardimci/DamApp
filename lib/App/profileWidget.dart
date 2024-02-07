import 'package:agaol/App/profileCardWidget.dart';
import 'package:agaol/Database/userDatabase.dart';
import 'package:agaol/Models/userModel.dart';
import 'package:agaol/loadingWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:agaol/App/bottomBarWidget.dart';
import 'package:agaol/App/topBarWidget.dart';
import 'package:provider/provider.dart';

class ProfileWidget extends StatefulWidget {

  ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {

  String name = 'Paul Mescal';
  String age = '27';
  String gender = 'Male';
  String preference = 'Female';
  String about = 'Acting my way to top. Got BAFTA but still single. '
      'Looking for someone to take to park. :)))';


  @override
  Widget build(BuildContext context) {

    final _uid = Provider.of<User?>(context)!.uid;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          "DamApp",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),
        ),
        actions: [
          IconButton(

            color: Colors.white,
            icon: Icon(Icons.settings),
            onPressed: () {
              // Add action for the settings button
              Navigator.pushReplacementNamed(context, "/settings");
            },

          ),
        ],
      ),
      bottomNavigationBar: BottomBarWidget(currentindex: 4,),
      body: Consumer<myUserProvider>(
        builder:(context,_user,child) {
          print(_user.currentUser);
          if(_user.currentUser == null){
            return LoadingWidget();
          }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 4.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                    child: Image(
                      image: AssetImage("assets/paul_mescal.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${_user.currentUser?.name}",
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          "${_user.currentUser?.gender}, ${_user.currentUser?.age}",
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.grey[800],
                          ),
                        ),
                        Text(
                          "Preferred: ${_user.currentUser?.preference}",
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.grey[800],
                          ),
                        ),
                        SizedBox(height: 12.0),
                        Text(
                          "About Me:",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "age",
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
