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
      'requests' : []
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

  Future<DocumentSnapshot>? get currentUser async {
    DocumentSnapshot snapshot = await userCollection.doc(uid).get();
    return snapshot;
  }

}
