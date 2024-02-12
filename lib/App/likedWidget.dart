import 'package:agaol/App/profileCardWidget.dart';
import 'package:agaol/App/profileWidget.dart';
import 'package:agaol/App/requestCardWidget.dart';
import 'package:agaol/Auth/authService.dart';
import 'package:agaol/Database/userDatabase.dart';
import 'package:agaol/Models/requestModel.dart';
import 'package:agaol/Models/userModel.dart';
import 'package:agaol/Providers/likedWidgetProvider.dart';
import 'package:agaol/Providers/myUserProvider.dart';
import 'package:agaol/loadingWidget.dart';
import 'package:flutter/material.dart';
import 'package:agaol/App/bottomBarWidget.dart';
import 'package:agaol/App/topBarWidget.dart';
import 'package:provider/provider.dart';


class LikedWidget extends StatefulWidget {
  LikedWidget({super.key});

  @override
  State<LikedWidget> createState() => _LikedWidgetState();
}

class _LikedWidgetState extends State<LikedWidget> {
  bool reload = false;

  @override
  Widget build(BuildContext context) {

    LikedWidgetProvider? provider = Provider.of<LikedWidgetProvider?>(context);
    List<LikeProfileWidget> widgetList = [];

    if(provider == null){
      return Scaffold(body: Center(child: LoadingWidget()));
    }
    else {

      print(provider.acceptedUsertoMyUser.values);

      for (myUser? profile in provider.acceptedUsertoMyUser.values) {
        widgetList.add(LikeProfileWidget(
          name: profile?.name,
          gender: profile?.gender,
          age: profile?.age,
          preference: profile?.preference,
          about: profile?.about,
          provider: provider,
          uid: profile?.uid,
          picture: profile?.picture,
        )
        );
      }
    }

    if(widgetList.isEmpty){
      return Scaffold(
        appBar: TopBarWidget(title: 'DamApp',),
        bottomNavigationBar: BottomBarWidget(currentindex: 0,),
        body: Center(
          child: ElevatedButton(
            onPressed: ()async{
              await provider.fetchData();
              setState(() {
                reload != reload;
              });
            }, child: const Text("Refresh!"),
          ),
        ),
      );
    }
      
    return Scaffold(
      appBar: TopBarWidget(title: 'DamApp',),
      bottomNavigationBar: BottomBarWidget(currentindex: 0,),
      body: RefreshIndicator(
        onRefresh: ()async{
          await provider.fetchData();
          setState(() {
            reload != reload;
          });

        },
        child: SingleChildScrollView(
        child: Column(
        children: widgetList,
          ),
        ),
      ),
    );
  }
}

class LikeProfileWidget extends StatefulWidget {

  String? name;
  String? gender;
  String? preference;
  String? age;
  String? about;
  String? uid;
  String? picture;
  LikedWidgetProvider? provider;

  LikeProfileWidget({
    super.key,
    required this.name,
    required this.gender,
    required this.age,
    required this.preference,
    required this.about,
    required this.provider,
    required this.uid,
    required this.picture,
  });

  @override
  State<LikeProfileWidget> createState() => _LikeProfileWidgetState();
}

class _LikeProfileWidgetState extends State<LikeProfileWidget> {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileCardWidget(name:widget.name, gender: widget.gender, age: widget.age, preference: widget.preference,about: widget.about, picture: widget.picture) ,
        Container(
          margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
          child: Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: () {
                  print(widget.name);
                    Navigator.pushNamed(context, '/liked/requests',arguments: widget.uid);
                },
                  icon: Icon(Icons.document_scanner),
                ),
                IconButton(onPressed: () {

                  List<String?> IDs = [widget.uid,AuthService().currentUser?.uid];
                  IDs.sort();
                  String? chatRoomID = "${IDs[0]!}_${IDs[1]!}";

                  List currentUserChatRooms = Provider.of<myUserProvider?>(context,listen: false)?.currentUser?.chatrooms ?? [];

                  List decodedChatRooms = [];
                  for(String roomid in currentUserChatRooms){
                    decodedChatRooms.add("${roomid.split("_")[0]}_${roomid.split("_")[1]}");
                    print("${roomid.split("_")[0]}_${roomid.split("_")[1]}");
                    print(chatRoomID);
                  }

                  if(!(decodedChatRooms.contains(chatRoomID))){
                    userDatabase(uid: AuthService().currentUser!.uid).updateChatRooms(AuthService().currentUser?.uid, widget.uid, chatRoomID, widget.name, Provider.of<myUserProvider?>(context,listen: false)?.currentUser?.name );
                  }

                  Navigator.pushNamed(context, "/chat",arguments:chatRoomID);
                },
                  icon: Icon(Icons.message),
                ),
                IconButton(onPressed: () {},
                  icon: Icon(Icons.delete),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

