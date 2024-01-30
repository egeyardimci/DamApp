import 'package:agaol/Auth/authWrapper.dart';
import 'package:agaol/addWidget.dart';
import 'package:agaol/likedWidget.dart';
import 'package:agaol/loading.dart';
import 'package:agaol/messagesWidget.dart';
import 'package:agaol/searchWidget.dart';
import 'package:agaol/settingsWidget.dart';
import 'package:agaol/wrapperWidget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:agaol/homeWidget.dart';
import 'package:agaol/profileWidget.dart';

import 'firebase_options.dart';
class AppWidget extends StatefulWidget {
  AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/loading': (context) => LoadingWidget(),
        '/home': (context) => HomeWidget(),
        '/profile': (context) => ProfileWidget(),
        '/add' : (context) => AddWidget(),
        '/search' : (context) => SearchWidget(),
        '/settings' : (context) => SettingsWidget(),
        '/liked' : (context) => LikedWidget(),
        '/messages' : (context) => MessagesWidget(),
      },
    );
  }
}
