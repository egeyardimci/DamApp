// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:agaol/quote.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import "quoteWidget.dart";

void main() => runApp(MaterialApp(
  home: HomeWidget()
));

class HomeWidget extends StatefulWidget {
  HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int level = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            icon: Icon(Icons.favorite),
            onPressed: () {
              // Add action for the settings button
              print('Settings button pressed');
            },
          ),
          IconButton(
            color: Colors.white,
            icon: Icon(Icons.message),
            onPressed: () {
              // Add action for the settings button
              print('Settings button pressed');
            },

          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 20, 10,0 ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 70.0,
                  backgroundImage: AssetImage('assets/foto.png')
                ),
              ),
              Divider(
                height: 60,
                color: Colors.grey[850],
              ),
              Text(
                "Ege Yardımcı",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Computer Science and Engineering",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Icon(
                    Icons.email,
                  ),
                  Text(
                    "  ege.yardimci@sabanciuniv.edu",
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ]
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Level $level",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Quotes(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.amber,
            icon: Icon(Icons.add),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.amber,
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}







