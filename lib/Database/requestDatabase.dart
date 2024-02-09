
import 'package:agaol/Auth/authService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../Models/requestModel.dart';

class requestDatabase {

  //User is referred by uid

  //Instance of user Collection
  final CollectionReference requestCollection = FirebaseFirestore.instance
      .collection("requests");

  //Updates user's data
  Future<DocumentReference> addNewRequest(name,uid,age,time,whopays,preference,location,date) async {
    //Update the user collection in database
    return await requestCollection.add({
      'name' : name,
      'uid': uid,
      'time': time,
      'whopays': whopays,
      'preference': preference,
      'age' : age,
      'location': location,
      'date' : date,
      'acceptedby': [],
      'declinedby': [],
    });
  }

  Future<List<QueryDocumentSnapshot?>> getRequests(int count) async {
    //Update the user collection in database
    QuerySnapshot? snapshot = await requestCollection.limit(count).get();
    return snapshot.docs;
  }

  Future getSingleRequestData(requestID,attributeName) async {
    DocumentSnapshot snapshot = await requestCollection.doc(requestID).get();
    Map<String, dynamic>? map = snapshot.data() as Map<String, dynamic>?;

    return map?[attributeName];
  }

  Future updateAcceptedList(String? requestID) async {

    final String? uid = AuthService().currentUser?.uid;
    List acceptedByList = await getSingleRequestData(requestID,"acceptedby");

    if(acceptedByList.contains(uid)){ //already accepted remove it
      acceptedByList.remove(uid);
    }
    else{ // not accepted
      acceptedByList.add(uid);
    }

    await requestCollection.doc(requestID).update({
      'acceptedby': acceptedByList,
    });
  }

  Future deleteRequest(requestID) async {
    await requestCollection.doc(requestID).delete();
  }


}
