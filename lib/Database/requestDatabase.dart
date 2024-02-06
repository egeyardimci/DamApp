import 'package:agaol/Auth/authService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class requestDatabase {

  //User is referred by uid

  //Instance of user Collection
  final CollectionReference userCollection = FirebaseFirestore.instance
      .collection("requests");

  //Updates user's data
  Future<void> updateRequestData() async {

    //Update the user collection in database
    await userCollection.add({
      'uid': "alas",
      'time': "12.12",
      'whopays': "ben",
      'preference': "female",
      'location': "female",
      'acceptedby': ["s","sd"],
      'declinedby': ["ssdf","sd"],
    });

  }
}
