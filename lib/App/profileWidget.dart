import 'package:agaol/App/profileCardWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:agaol/App/bottomBarWidget.dart';
import 'package:agaol/App/topBarWidget.dart';
import 'package:agaol/App/bottomBarWidget.dart';
import 'package:agaol/App/topBarWidget.dart';

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
      appBar: TopBarWidget(title: "DamApp",),
      bottomNavigationBar: BottomBarWidget(),
      body: ProfileCardWidget(name:"ege", gender: "male", age: 21, preference: "female")
    );
  }
}
