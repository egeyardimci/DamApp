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

  myRequest(
      {
        this.name,
        this.age,
        this.date,
        this.location,
        this.preference,
        this.time,
        this.uid,
        this.whopays,
        this.acceptedby,
        this.declinedby,
        this.requestid
      }
  );

  myRequest.fromMap(Map<String,dynamic>? requestdata,reqid){
    this.name = requestdata?["name"];
    this.age = requestdata?["age"];
    this.date  = requestdata?["date"];
    this.location  = requestdata?["location"];
    this.preference  = requestdata?["preference"];
    this.time  = requestdata?["time"];
    this.uid  = requestdata?["uid"];
    this.whopays  = requestdata?["whopays"];
    this.acceptedby  = requestdata?["acceptedby"];
    this.declinedby  = requestdata?["declinedby"];
    this.requestid  = reqid;

  }

  Map<String,dynamic>? toMap(Map<String,dynamic>? requestdata,reqid){
    return {
      'name' : name,
      'age' : age,
      'date' : date,
      'location' : location,
      'preference' : preference,
      'time' : time,
      'uid' : uid,
      'whopays' : whopays,
      'acceptedby' : acceptedby,
      'declinedby' : declinedby,
    };

  }

}