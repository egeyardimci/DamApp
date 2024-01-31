import 'package:agaol/Auth/authService.dart';
import 'package:agaol/Auth/authWrapper.dart';
import 'package:agaol/App/app.dart';
import 'package:flutter/material.dart';
import "package:provider/provider.dart";

class WrapperWidget extends StatefulWidget {
  WrapperWidget({super.key});

  @override
  State<WrapperWidget> createState() => _WrapperWidgetState();
}

class _WrapperWidgetState extends State<WrapperWidget> {
  @override
  Widget build(BuildContext context) {

    final myUser? user = Provider.of<myUser?>(context);

    if(user == null){

      return AuthWrapper();
    }
    else{
      return AppWidget();
    }
  }
}
