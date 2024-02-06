// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:agaol/App/bottomBarWidget.dart';
import 'package:agaol/App/requestCardWidget.dart';
import 'package:agaol/App/topBarWidget.dart';
import 'package:agaol/Database/requestDatabase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeWidget extends StatefulWidget {

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: TopBarWidget(title: 'DamApp',),
      bottomNavigationBar: BottomBarWidget(),
      body: Column(
            children: [
              RequestCardWidget(name: "as",date: "Persembe",
                  time: "17:00",location: "Istanbul",lookingFor: "Woman",whoPays: "Me") ,
              Expanded(
                child: Container(
                  margin: EdgeInsets.fromLTRB(20, 40, 20, 40),
                  child: Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(onPressed: () {},
                          icon: Icon(Icons.chevron_left),
                        ),
                        IconButton(onPressed: () {},
                          icon: Icon(Icons.thumb_up),
                        ),
                        IconButton(onPressed: () {},
                          icon: Icon(Icons.thumb_down),
                        ),
                        IconButton(onPressed: () {},
                          icon: Icon(Icons.chevron_right),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
      );
  }
}



