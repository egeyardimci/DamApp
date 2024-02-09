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
  String? requestid = "";

  myRequest({this.name,this.age,this.date,this.location,this.preference,this.time,this.uid,
  this.whopays,this.acceptedby,this.declinedby,this.requestid});

}

class myRequestProvider with ChangeNotifier{

  Future<List<myRequest>?> getRequests() async{
    print("EGE");
    List<myRequest> requestList = [];

    List list = await requestDatabase().getRequests(100);


    for(var i in list){
      requestList.add(myRequest(name: i?["name"],age: i?["age"],date: i?["date"],
      declinedby: i?["declinedby"],acceptedby: i?["acceptedby"],location: i?["location"],
      time: i?["time"],uid: i?["uid"],preference: i?["preference"],whopays: i?["whopays"],requestid: i?.id));
    }

    notifyListeners();
    return requestList;

  }



}

class userRequestProvider with ChangeNotifier{

  List<myRequest>? userRequests = [];


  Future<userRequestProvider> setUserRequests (List? requestList) async{
    this.userRequests = await getUserRequests(requestList);
    notifyListeners();
    return this;
  }

  Future<List<myRequest>?> getUserRequests(List? requestList) async {
    //Update the user collection in database,
    if(requestList == null){
      return null;
    }
    List<myRequest> myRequestsList = [];

    for(String? id in requestList) {
      DocumentSnapshot snapshot = await requestDatabase().requestCollection
          .doc(id).get();

      String? requestID = snapshot.id;

      Map<String, dynamic>? i = snapshot.data() as Map<String, dynamic>?;
      myRequest current = myRequest(name: i?["name"],age: i?["age"],date: i?["date"],
          declinedby: i?["declinedby"],acceptedby: i?["acceptedby"],location: i?["location"],
          time: i?["time"],uid: i?["uid"],preference: i?["preference"],whopays: i?["whopays"],requestid: requestID);

      myRequestsList.add(current);
    }
    return myRequestsList;
  }


}