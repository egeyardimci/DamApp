import 'package:agaol/profileCardWidget.dart';
import 'package:agaol/profileWidget.dart';
import 'package:agaol/requestCardWidget.dart';
import 'package:flutter/material.dart';
import 'package:agaol/bottomBarWidget.dart';
import 'package:agaol/topBarWidget.dart';


class LikedWidget extends StatelessWidget {
  LikedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBarWidget(title: 'DamApp',),
      bottomNavigationBar: BottomBarWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            LikeProfileWidget(),
            LikeProfileWidget(),
            LikeProfileWidget(),
            LikeProfileWidget()
          ],
        ),
      )
    );
  }
}

class LikeProfileWidget extends StatefulWidget {
  LikeProfileWidget({super.key});

  @override
  State<LikeProfileWidget> createState() => _LikeProfileWidgetState();
}

class _LikeProfileWidgetState extends State<LikeProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileCardWidget(name:"ege", gender: "male", age: 21, preference: "female") ,
        Container(
          margin: EdgeInsets.fromLTRB(130, 10, 130, 10),
          child: Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: () {},
                  icon: Icon(Icons.message),
                ),
                IconButton(onPressed: () {},
                  icon: Icon(Icons.delete),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

