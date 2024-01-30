import 'package:flutter/material.dart';
class registerWidget extends StatefulWidget {
  const registerWidget({super.key});

  @override
  State<registerWidget> createState() => _registerWidgetState();
}

class _registerWidgetState extends State<registerWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        onPressed: () {},
        child: Text("register"),
      ),
    );
  }
}

