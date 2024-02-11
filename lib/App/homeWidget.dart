// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:agaol/App/bottomBarWidget.dart';
import 'package:agaol/App/myRequestsWidget.dart';
import 'package:agaol/App/requestCardWidget.dart';
import 'package:agaol/App/topBarWidget.dart';
import 'package:agaol/Auth/authService.dart';
import 'package:agaol/Database/requestDatabase.dart';
import 'package:agaol/Database/userDatabase.dart';
import 'package:agaol/Models/requestModel.dart';
import 'package:agaol/Providers/homeWidgetProvider.dart';
import 'package:agaol/loadingWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../Models/userModel.dart';
import '../Providers/myUserProvider.dart';

class HomeWidget extends StatefulWidget {

  @override
  State<HomeWidget> createState() => _HomeWidgetState();

  int currentRequest = 0;
}

class _HomeWidgetState extends State<HomeWidget> {

  bool reload = false;

  @override
  Widget build(BuildContext context) {
    final dynamic _HomeWidgetProvider = Provider.of<HomeWidgetProvider?>(context);
    final List<myRequest>? requestData = _HomeWidgetProvider?.requestList;

    if(requestData == null){
      return LoadingWidget();
    }

    else {

      final myUserProvider? _user = Provider.of<myUserProvider?>(context,listen: false);
      final userDatabase userDataBaseRef = userDatabase(uid: AuthService().currentUser!.uid);
      final requestDatabase requestDataBaseRef = requestDatabase();

      dynamic likecolor = Colors.grey.shade800;
      dynamic dislikecolor = Colors.grey.shade800;


      List likedrequests = _user?.currentUser?.likedrequests ?? [];
      List dislikedrequests = _user?.currentUser?.dislikedrequests ?? [];

      if(likedrequests.contains(requestData[widget.currentRequest].requestid)){
        likecolor = Colors.green;
      }
      if(dislikedrequests.contains(requestData[widget.currentRequest].requestid)){
        dislikecolor = Colors.red;
      }

      return Scaffold(
          appBar: TopBarWidget(title: 'DamApp',),
          bottomNavigationBar: BottomBarWidget(currentindex: 0,),
          body: Column(
            children: [
              RequestCardWidget(
                  name: requestData[widget.currentRequest].name ?? "",
                  age: requestData[widget.currentRequest].age ?? "",
                  date: requestData[widget.currentRequest].date ?? "",
                  time: requestData[widget.currentRequest].time ?? "",
                  location: requestData[widget.currentRequest].location ?? "",
                  lookingFor: requestData[widget.currentRequest].preference ??
                      "",
                  whoPays: requestData[widget.currentRequest].whopays ?? ""),
              Expanded(
                child: Container(
                  margin: EdgeInsets.fromLTRB(20, 40, 20, 40),
                  child: Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(onPressed: () {
                          setState(() {
                            if (widget.currentRequest > 0) {
                              widget.currentRequest--;
                            }
                          });
                        },
                          icon: Icon(Icons.chevron_left),
                        ),
                        IconButton(onPressed: () async{

                          await userDataBaseRef.updateLikedRequestList(requestData[widget.currentRequest].requestid);
                          await requestDataBaseRef.updateAcceptedList(requestData[widget.currentRequest].requestid);
                          await _user?.updateUserData();
                          setState(() {
                            reload = !reload;
                          });
                        },
                          icon: Icon(Icons.thumb_up,
                              color: likecolor),
                        ),
                        IconButton(onPressed: () async{
                          await userDataBaseRef.updateDislikedRequestList(requestData[widget.currentRequest].requestid);
                          await requestDataBaseRef.updateAcceptedList(requestData[widget.currentRequest].requestid);
                          await _user?.updateUserData();
                          setState(() {
                            reload = !reload;
                          });

                        },
                          icon: Icon(Icons.thumb_down,
                          color: dislikecolor,),
                        ),
                        IconButton(onPressed: () {
                          setState(() {
                            if (widget.currentRequest < requestData!.length - 1) {
                              widget.currentRequest++;
                            }
                          });
                        },
                          icon: Icon(Icons.chevron_right),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
    }
  }
}



