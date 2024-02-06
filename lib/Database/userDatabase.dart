import 'package:agaol/Auth/authService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
    });
  }

  Future<DocumentSnapshot>? get currentUser async {
    DocumentSnapshot snapshot = await userCollection.doc(uid).get();
    return snapshot;
  }

}
