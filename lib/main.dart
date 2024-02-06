// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:agaol/Auth/authWrapper.dart';
import 'package:agaol/App/addWidget.dart';
import 'package:agaol/App/likedWidget.dart';
import 'package:agaol/Database/userDatabase.dart';
import 'package:agaol/loadingWidget.dart';
import 'package:agaol/App/messagesWidget.dart';
import 'package:agaol/App/searchWidget.dart';
import 'package:agaol/App/settingsWidget.dart';
import 'package:agaol/wrapperWidget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:agaol/App/homeWidget.dart';
import 'package:agaol/App/profileWidget.dart';
import 'package:provider/provider.dart';

import 'Auth/authService.dart';
import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
  runApp(MaterialApp(
    home: EntryWidget(),
  ));
}

class EntryWidget extends StatelessWidget {
  EntryWidget({super.key});

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(value: _auth.user, initialData: null,
      child: WrapperWidget(),
    );
  }
}


