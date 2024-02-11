import 'package:agaol/App/profileCardWidget.dart';
import 'package:agaol/App/profileWidget.dart';
import 'package:agaol/App/requestCardWidget.dart';
import 'package:agaol/Models/userModel.dart';
import 'package:agaol/Providers/likedWidgetProvider.dart';
import 'package:agaol/loadingWidget.dart';
import 'package:flutter/material.dart';
import 'package:agaol/App/bottomBarWidget.dart';
import 'package:agaol/App/topBarWidget.dart';
import 'package:provider/provider.dart';


class LikedWidget extends StatelessWidget {
  LikedWidget({super.key});

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
        )
        );
      }
    }

    return Scaffold(
      appBar: TopBarWidget(title: 'DamApp',),
      bottomNavigationBar: BottomBarWidget(currentindex: 0,),
      body: SingleChildScrollView(
      child: Column(
      children: widgetList,
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
  LikedWidgetProvider? provider;

  LikeProfileWidget({
    super.key,
    required this.name,
    required this.gender,
    required this.age,
    required this.preference,
    required this.about,
    required this.provider,
    required this.uid

  });

  @override
  State<LikeProfileWidget> createState() => _LikeProfileWidgetState();
}

class _LikeProfileWidgetState extends State<LikeProfileWidget> {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileCardWidget(name:widget.name, gender: widget.gender, age: widget.age, preference: widget.preference,about: widget.about) ,
        Container(
          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: () {
                  List requestsIDList = widget.provider?.acceptedUserIDtoRequestID[widget.uid] ?? [];
                    for (String? requestIDs in requestsIDList) {
                      print(widget.provider?.requestIDtoMyRequestMap[requestIDs]?.location);
                    }
                },
                  icon: Icon(Icons.document_scanner),
                ),
                IconButton(onPressed: () {},
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

