import 'package:agaol/Auth/authService.dart';
import 'package:flutter/material.dart';
import 'package:agaol/App/bottomBarWidget.dart';
import 'package:agaol/App/topBarWidget.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({super.key});

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBarWidget(title: 'DamApp',),
      body: ElevatedButton(
        onPressed: () async {
          await _auth.signOut();
        },
        child: Text("Log Out"),
      ),
      bottomNavigationBar: BottomBarWidget(),
    );
  }
}
