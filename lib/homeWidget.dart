// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:agaol/bottomBarWidget.dart';
import 'package:agaol/topBarWidget.dart';
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
    );
  }
}


