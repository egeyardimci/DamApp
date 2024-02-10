import 'package:agaol/Auth/authService.dart';
import 'package:agaol/Models/requestModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';

class userDatabase {

  //User is referred by uid
  final String uid;

  userDatabase({required this.uid});

  //Instance of user Collection
  final CollectionReference userCollection = FirebaseFirestore.instance
      .collection("users");

  //Updates user's data
  Future updateUserData(Map<String, dynamic> userInfoMap) async {

    //Update the user collection in database
    return await userCollection.doc(uid).set({
      'name': userInfoMap['name'],
      'age': userInfoMap['age'],
      'gender': userInfoMap['gender'],
      'preference': userInfoMap['preference'],
      'requests' : [],
      'likedrequests' : [],
      'dislikedrequests' : []
    });
  }

  Future updateRequestListAdd(String? newRequestID) async {

    List requestList = await getSingleUserData("requests");
    requestList.add(newRequestID);

    await userCollection.doc(uid).update({
      'requests': requestList,
    });
  }

  Future updateRequestListDelete(String? requestID) async {

    List requestList = await getSingleUserData("requests");
    try {
      requestList.remove(requestID);
    }catch(e){
      print("Error on deletion of request");
    }

    await userCollection.doc(uid).update({
      'requests': requestList,
    });
  }


  Future getSingleUserData(attributeName) async {
    DocumentSnapshot<Object?>? snapshot = await currentUser;
    Map<String, dynamic>? map = snapshot?.data() as Map<String, dynamic>?;

    return map?[attributeName];
  }

  Future updateSingleUserData(String attributeName, String attributeValue) async {
    return await userCollection.doc(uid).update({
      attributeName: attributeValue,
    });
  }

  Future<Map<String,dynamic>?> getUserDataAsMap() async{
    DocumentSnapshot<Object?>? snapshot = await currentUser;
    Map<String, dynamic>? map = snapshot?.data() as Map<String, dynamic>?;
    return map;
  }

  Future<DocumentSnapshot>? get currentUser async {
    DocumentSnapshot snapshot = await userCollection.doc(uid).get();
    return snapshot;
  }

  Future updateLikedRequestList(String? requestID) async {

    List likedRequestList = await getSingleUserData("likedrequests"); // List of liked requests
    List dislikedRequestList = await getSingleUserData("dislikedrequests"); // List of disliked requests

    if(likedRequestList.contains(requestID)){ //already liked remove like
      likedRequestList.remove(requestID);
    }
    else{ // not liked
      if(dislikedRequestList.contains(requestID)) { // check if it is disliked
        //if it is disliked remove dislike
        dislikedRequestList.remove(requestID);
      }
      //add like
      likedRequestList.add(requestID);
    }

    await userCollection.doc(uid).update({
      'likedrequests': likedRequestList,
      'dislikedrequests': dislikedRequestList
    });

  }

  Future updateDislikedRequestList(String? requestID) async {
    List likedRequestList = await getSingleUserData("likedrequests"); // List of liked requests
    List dislikedRequestList = await getSingleUserData("dislikedrequests"); // List of disliked requests

    if(dislikedRequestList.contains(requestID)){ //already disliked remove dislike
      dislikedRequestList.remove(requestID);
    }
    else{ // not disliked
      if(likedRequestList.contains(requestID)) { // check if it is liked
        //if it is liked remove like
        likedRequestList.remove(requestID);
      }
      //add dislike
      dislikedRequestList.add(requestID);
    }

    await userCollection.doc(uid).update({
      'likedrequests': likedRequestList,
      'dislikedrequests': dislikedRequestList
    });
  }


}
