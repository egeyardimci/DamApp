import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:agaol/App/bottomBarWidget.dart';
import 'package:agaol/App/topBarWidget.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:agaol/Database/userDatabase.dart';
import "package:provider/provider.dart";
import 'package:firebase_auth/firebase_auth.dart';

import '../Auth/authService.dart';
import '../Database/chatDatabase.dart';
import '../Providers/myUserProvider.dart';
import '../loadingWidget.dart';



class MessagesWidget extends StatefulWidget {
  MessagesWidget({super.key});

  @override
  State<MessagesWidget> createState() => _MessagesWidgetState();
}

class _MessagesWidgetState extends State<MessagesWidget> {


  bool reload = false;
  Widget _buildChatRooms(String? roomid) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 90,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 6),
                    child: Text(
                      roomid?.split("_")[2] ?? "",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: IconButton(
                      onPressed: (){
                        Navigator.pushNamed(context, "/chat",
                            arguments:"${roomid?.split("_")[0]}_${roomid?.split("_")[1]}");
                      },
                      icon: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ]
          ),
        ),
      ),
    );
  }

  @override
  build(BuildContext context) {
    final myUserProvider? user = Provider.of<myUserProvider?>(context);

    return Scaffold(
      bottomNavigationBar: BottomBarWidget(currentindex: 4,),
      appBar: TopBarWidget(title: 'DamApp',),
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Column(
            children: [
              Expanded(
                child: RefreshIndicator(
                  onRefresh: ()async{
                    user.updateUserData();
                    setState(() {
                      reload != reload;
                    });
                  },
                  child: ListView(
                    children: user!.currentUser!.chatrooms!.map((rooms) =>
                        _buildChatRooms(rooms)).toList(),
                  ),
                ),
              ),
            ]
        ),
      ),
    );
  }
}
