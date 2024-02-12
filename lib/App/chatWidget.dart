import 'package:agaol/App/topBarWidget.dart';
import 'package:agaol/Auth/authService.dart';
import 'package:agaol/Database/chatDatabase.dart';
import 'package:agaol/loadingWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../Providers/myUserProvider.dart';

class ChatWidget extends StatefulWidget {
  ChatWidget({super.key});

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {


  Widget _buildMessages(DocumentSnapshot snapshot){
    Map<String?,dynamic> data = snapshot.data() as Map<String?,dynamic>;
    var messageAlign = Alignment.centerLeft;

    if(data["author"] == AuthService().currentUser?.uid){
      messageAlign = Alignment.centerRight;
    }

    return Container(
      alignment: messageAlign,
      child: Column(
          children: [
            Text(data["authorName"] ?? ""),
            Text(data["text"] ?? ""),
        ]
      ),
    );
  }

  @override
  build(BuildContext context) {

    String chatRoomID = ModalRoute.of(context)?.settings.arguments as String;

    var messageController;
    String? chatMessage;

    return StreamBuilder(stream: chatDatabase().getMessages(chatRoomID),
        builder: (context,stream){
          if(stream.connectionState == ConnectionState.waiting){
            return LoadingWidget();
          }
          return Scaffold(
            appBar: TopBarWidget( title: 'DamApp',),
            body: Column(
              children: [
                Expanded(
                  flex: 90,
                  child: ListView(
                    children: stream.data!.docs.map((snapshot) => _buildMessages(snapshot)).toList(),
                    ),
                  ),
                Expanded(
                  flex: 10,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          onChanged: (data){
                            chatMessage = data;
                          },
                          controller: messageController,
                          obscureText: false,
                          decoration: const InputDecoration(
                            hintText: 'Type something...',
                          ),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: (){
                            final myUserProvider? user = Provider.of<myUserProvider?>(context,listen: false);
                            chatDatabase().sendMessage(chatRoomID,user!.currentUser?.name ?? "No Name",chatMessage);
                          },
                          child: Text("Send")
                      ),
                    ],
                  ),
                )

              ]
            ),
          );
        }
    );
  }
}


