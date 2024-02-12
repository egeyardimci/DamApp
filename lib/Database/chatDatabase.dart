import 'package:agaol/Auth/authService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class chatDatabase{

  final CollectionReference chatCollection = FirebaseFirestore.instance
      .collection("chatrooms");


  Stream<QuerySnapshot> getMessages(String roomID) {
    return chatCollection.doc(roomID).collection("messages").orderBy("timestamp",descending: false).snapshots();
  }

  Future sendMessage(String roomID, String name,String? message) async{
    await chatCollection.doc(roomID).collection("messages").add(
      {
        "text" : message ?? "",
        "authorID" : AuthService().currentUser?.uid,
        "authorName" : name,
        "timestamp" : Timestamp.now()
      }
    );
  }

}