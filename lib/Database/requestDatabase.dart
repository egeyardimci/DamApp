
import 'package:agaol/Auth/authService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../Models/requestModel.dart';
import '../Models/userModel.dart';
import '../Database/userDatabase.dart';

class requestDatabase {

  //User is referred by uid

  //Instance of user Collection
  final CollectionReference requestCollection = FirebaseFirestore.instance
      .collection("requests");

  //Updates user's data
  Future<DocumentReference> addNewRequest(uid,time,whopays,location,date) async {
    //Update the user collection in database
    return await requestCollection.add({
      'uid': uid,
      'time': time,
      'whopays': whopays,
      'location': location,
      'date' : date,
      'acceptedby': [],
      'declinedby': []
    });
  }

  Future<List<QueryDocumentSnapshot?>> getRequestSnapshots(int count) async {
    //Update the user collection in database
    QuerySnapshot? snapshot = await requestCollection.limit(count).get();
    return snapshot.docs;
  }

  Future<List<myRequest>?> getRequests() async{
    List<myRequest> requestList = [];
    List<QueryDocumentSnapshot?> requestdatalist = await getRequestSnapshots(100);

    for(QueryDocumentSnapshot? requestdata in requestdatalist){
      requestList.add(myRequest.fromMap(requestdata?.data() as Map<String, dynamic>?,requestdata?.id));
    }

    for(var i = 0; i < requestList.length; i++) {
      String? uid = requestList[i].uid;

      if (uid != null) {
        userDatabase userDb = userDatabase(uid: uid);
        myUser user = await userDb.getUserDataByID(uid) as myUser;
        requestList[i].picture = user.picture;
        requestList[i].name = user.name;
        requestList[i].age = user.age;
        requestList[i].preference = user.preference;
      }
    }

    return requestList;
  }

  Future<myRequest> getRequestByID(String? id) async{
    DocumentSnapshot snapshot = await requestDatabase().requestCollection
        .doc(id).get();
    String? requestID = snapshot.id;
    Map<String, dynamic>? requestMap = snapshot.data() as Map<String, dynamic>?;

    myRequest current = myRequest.fromMap(requestMap,requestID);

    String? uid = current.uid;

    if (uid != null) {
      userDatabase userDb = userDatabase(uid: uid);
      myUser user = await userDb.getUserDataByID(uid) as myUser;
      current.picture = user.picture;
      current.name = user.name;
      current.age = user.age;
      current.preference = user.preference;
    }

    return current;
  }

  Future getSingleRequestData(requestID,attributeName) async {
    DocumentSnapshot snapshot = await requestCollection.doc(requestID).get();
    Map<String, dynamic>? map = snapshot.data() as Map<String, dynamic>?;

    return map?[attributeName];
  }

  Future getRequestDataByID(requestID) async {
    DocumentSnapshot snapshot = await requestCollection.doc(requestID).get();
    Map<String, dynamic>? map = snapshot.data() as Map<String, dynamic>?;

    return myRequest.fromMap(map, requestID);
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
