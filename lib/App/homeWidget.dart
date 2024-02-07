// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:agaol/App/bottomBarWidget.dart';
import 'package:agaol/App/myRequestsWidget.dart';
import 'package:agaol/App/requestCardWidget.dart';
import 'package:agaol/App/topBarWidget.dart';
import 'package:agaol/Database/requestDatabase.dart';
import 'package:agaol/Models/requestModel.dart';
import 'package:agaol/loadingWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../Models/userModel.dart';

class HomeWidget extends StatefulWidget {

  @override
  State<HomeWidget> createState() => _HomeWidgetState();

  int currentRequest = 0;
}

class _HomeWidgetState extends State<HomeWidget> {

  @override
  Widget build(BuildContext context) {
    final List<myRequest>? requestData = Provider.of<List<myRequest>?>(context);;
    if(requestData == null){
      return LoadingWidget();
    }
    else {
      return Scaffold(
        appBar: TopBarWidget(title: 'DamApp',),
        bottomNavigationBar: BottomBarWidget(currentindex: 0,),
        body: Column(
          children: [
            RequestCardWidget(
                name: requestData?[widget.currentRequest].name ?? "",
                date: requestData?[widget.currentRequest].date ?? "",
                time: requestData?[widget.currentRequest].time ?? "",
                location: requestData?[widget.currentRequest].location ?? "",
                lookingFor: requestData?[widget.currentRequest].preference ??
                    "",
                whoPays: requestData?[widget.currentRequest].whopays ?? ""),
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
                      IconButton(onPressed: () {},
                        icon: Icon(Icons.thumb_up),
                      ),
                      IconButton(onPressed: () {},
                        icon: Icon(Icons.thumb_down),
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



