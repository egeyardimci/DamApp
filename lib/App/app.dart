import 'package:agaol/App/chatWidget.dart';
import 'package:agaol/App/likedRequestWidget.dart';
import 'package:agaol/App/myRequestsWidget.dart';
import 'package:agaol/Auth/authWrapper.dart';
import 'package:agaol/App/addWidget.dart';
import 'package:agaol/App/likedWidget.dart';
import 'package:agaol/Models/userModel.dart';
import 'package:agaol/Providers/likedWidgetProvider.dart';
import 'package:agaol/loadingWidget.dart';
import 'package:agaol/App/messagesWidget.dart';
import 'package:agaol/App/searchWidget.dart';
import 'package:agaol/App/settingsWidget.dart';
import 'package:agaol/wrapperWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:agaol/App/homeWidget.dart';
import 'package:agaol/App/profileWidget.dart';
import 'package:provider/provider.dart';

import '../Database/userDatabase.dart';
import '../Models/requestModel.dart';
import '../Providers/myUserProvider.dart';
import '../Providers/userRequestProvider.dart';
import '../firebase_options.dart';
class AppWidget extends StatefulWidget {
  AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final myUserProvider? user = Provider.of<myUserProvider?>(context);
    return MultiProvider(
      providers: [
        FutureProvider<userRequestProvider?>(
          create: (_) => userRequestProvider().setUserRequests(user?.currentUser?.requests),
          initialData: null,
        ),
      ],
      child: MaterialApp(
        initialRoute: '/home',
        routes: {
          '/loading': (context) => LoadingWidget(),
          '/home': (context) => HomeWidget(),
          '/profile': (context) => ProfileWidget(),
          '/add' : (context) => AddWidget(),
          '/search' : (context) => SearchWidget(),
          '/settings' : (context) => SettingsWidget(),
          '/liked' : (context) => LikedWidget(),
          '/liked/requests' : (context) => LikedRequestWidget(),
          '/messages' : (context) => MessagesWidget(),
          '/myrequests' : (context) => MyRequestsWidget(),
          '/chat' : (context) => ChatWidget(),
        },
      ),
    );
  }
}
