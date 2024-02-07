
import 'package:agaol/Auth/authService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class requestDatabase {

  //User is referred by uid

  //Instance of user Collection
  final CollectionReference requestCollection = FirebaseFirestore.instance
      .collection("requests");

  //Updates user's data
  Future<void> addNewRequest(name,uid,age,time,whopays,preference,location,date) async {
    //Update the user collection in database
    await requestCollection.add({
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

}
