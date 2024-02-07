import 'package:agaol/Database/requestDatabase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class myRequest{
  String? name = "";
  String? age = "";
  String? date = "";
  List? declinedby = [];
  List? acceptedby = [];
  String? location = "";
  String? preference = "";
  String? time = "";
  String? uid = "";
  String? whopays = "";

  myRequest({this.name,this.age,this.date,this.location,this.preference,this.time,this.uid,
  this.whopays,this.acceptedby,this.declinedby});

}

class myRequestProvider with ChangeNotifier{

  Future<List<myRequest>?> getRequests() async{
    print("EGE");
    List<myRequest> requestList = [];

    List list = await requestDatabase().getRequests(2);


    for(var i in list){
      requestList.add(myRequest(name: i?["name"],age: i?["age"],date: i?["date"],
      declinedby: i?["declinedby"],acceptedby: i?["acceptedby"],location: i?["location"],
      time: i?["time"],uid: i?["uid"],preference: i?["preference"],whopays: i?["whopays"]));
    }

    notifyListeners();
    return requestList;

  }

}