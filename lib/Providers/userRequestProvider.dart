import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../Database/requestDatabase.dart';
import '../Models/requestModel.dart';

class userRequestProvider with ChangeNotifier {

  List<myRequest>? userRequests = [];


  Future<userRequestProvider> setUserRequests(List? requestList) async {
    this.userRequests = await getUserRequests(requestList);
    notifyListeners();
    return this;
  }

  Future<List<myRequest>?> getUserRequests(List? requestList) async {

    if (requestList == null) {
      return null;
    }

    List<myRequest> myRequestsList = [];

    for (String? id in requestList) {

      myRequest current = await requestDatabase().getRequestByID(id);

      myRequestsList.add(current);
    }
    return myRequestsList;
  }
}
