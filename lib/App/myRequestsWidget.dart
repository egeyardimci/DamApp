import 'package:agaol/App/topBarWidget.dart';
import 'package:flutter/material.dart';

import 'bottomBarWidget.dart';

class MyRequestsWidget extends StatelessWidget {
  MyRequestsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: TopBarWidget(title: 'DamApp',),
      bottomNavigationBar: BottomBarWidget(currentindex: 3,),
    );;
  }
}
