// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:agaol/addWidget.dart';
import 'package:agaol/likedWidget.dart';
import 'package:agaol/loading.dart';
import 'package:agaol/messagesWidget.dart';
import 'package:agaol/searchWidget.dart';
import 'package:agaol/settingsWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:agaol/homeWidget.dart';
import 'package:agaol/profileWidget.dart';

void main() => runApp(MaterialApp(

  initialRoute: '/loading',
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
));



