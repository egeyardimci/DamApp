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
    var messageCrossAxisAlignment = CrossAxisAlignment.start;

    if(data["authorID"] == AuthService().currentUser?.uid){
      messageAlign = Alignment.centerRight;
      messageCrossAxisAlignment = CrossAxisAlignment.end;
    }

    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      alignment: messageAlign,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 6),
              child: Text(
                data["authorName"] ?? "",
                style: TextStyle(
                  fontSize: 16,
                    fontWeight: FontWeight.bold
                ),
              
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.red
              ),
              child: Text(data["text"] ?? "",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),

            ),
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
            body: Container(
              padding: EdgeInsets.fromLTRB(0,10,0,10),
              child: Column(
                children: [
                  Expanded(
                    flex: 90,
                    child: ListView(
                      children: stream.data!.docs.map((snapshot) => _buildMessages(snapshot)).toList(),
                      ),
                    ),
                  Expanded(
                    flex: 10,
                    child: Padding(
                      padding: EdgeInsets.all(10),
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
                                border: InputBorder.none,
                                hintText: 'Type something...',
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(2, 0, 0, 0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)
                                )
                                                  
                              ),
                                onPressed: (){
                                  final myUserProvider? user = Provider.of<myUserProvider?>(context,listen: false);
                                  chatDatabase().sendMessage(chatRoomID,user!.currentUser?.name ?? "No Name",chatMessage);
                                },
                                child: Text("Send")
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
              
                ]
              ),
            ),
          );
        }
    );
  }
}


