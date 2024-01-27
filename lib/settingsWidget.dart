import 'package:flutter/material.dart';
import 'package:agaol/bottomBarWidget.dart';
import 'package:agaol/topBarWidget.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({super.key});

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBarWidget(title: 'DamApp',),
      bottomNavigationBar: BottomBarWidget(),
    );
  }
}
