import 'package:flutter/material.dart';
import 'package:agaol/bottomBarWidget.dart';
import 'package:agaol/topBarWidget.dart';

class AddWidget extends StatefulWidget {
  AddWidget({super.key});

  @override
  State<AddWidget> createState() => _AddWidgetState();
}

class _AddWidgetState extends State<AddWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBarWidget(title: 'DamApp',),
      bottomNavigationBar: BottomBarWidget(),
    );
  }
}
