
import 'dart:math';

import 'package:agaol/Auth/authService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../Database/userDatabase.dart';

class myUser{
  String? name = "";
  String? age = "";
  String? gender = "";
  String? preference = "";
  String? about = "";
  List? requests = [];
  List? likedrequests = [];
  List? dislikedrequests= [];
  String? uid = "";
  List? chatrooms = [];

  myUser(
      {
        this.name,
        this.age,
        this.gender,
        this.preference,
        this.about,
        this.requests,
        this.likedrequests,
        this.dislikedrequests,
        this.chatrooms
      })
  {
    this.uid = AuthService().currentUser?.uid;
  }

  myUser.fromMap (Map<String, dynamic>? userdata){

      name = userdata?["name"];
      age = userdata?["age"];
      gender = userdata?["gender"];
      preference = userdata?["preference"];
      about = userdata?["about"];
      requests = userdata?["requests"];
      likedrequests = userdata?["likedrequests"];
      dislikedrequests =  userdata?["dislikedrequests"];
      uid = AuthService().currentUser?.uid;
      chatrooms = userdata?["chatrooms"];

  }

  Map<String, dynamic>? toMap(myUser user){
    return {
      'name' : user.name,
      'age' : user.age,
      'gender' : user.gender,
      'preference' : user.preference,
      'about' : user.about,
      'requests' : user.requests,
      'likedrequests' : user.likedrequests,
      'dislikedrequests' : user.dislikedrequests,
      'chatrooms' : user.chatrooms
    };
  }

}
