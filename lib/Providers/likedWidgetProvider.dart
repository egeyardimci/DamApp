import 'package:agaol/Auth/authService.dart';
import 'package:agaol/Database/requestDatabase.dart';
import 'package:agaol/Database/userDatabase.dart';
import 'package:agaol/Models/requestModel.dart';
import 'package:agaol/Models/userModel.dart';
import 'package:agaol/Providers/myUserProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class LikedWidgetProvider with ChangeNotifier {

  bool isUpdated = false;

  String currentUserID = AuthService().currentUser!.uid;

  userDatabase userDatabaseRef = userDatabase(uid: AuthService().currentUser!.uid);
  requestDatabase requestDatabaseRef = requestDatabase();

  List requestIDList = [];

  Map<String?,myRequest?> requestIDtoMyRequestMap = {};
  Map<String?,List?> acceptedUserIDtoRequestID = {};
  Map<String?,myUser?> acceptedUsertoMyUser = {};


  Future<void> flushData() async{
    requestIDList = [];

    requestIDtoMyRequestMap = {};
    acceptedUserIDtoRequestID = {};
    acceptedUsertoMyUser = {};
  }

  Future<LikedWidgetProvider>? fetchData() async{
    await flushData();

    myUser? currentUser = await userDatabaseRef.getCurrentUser();
    requestIDList = currentUser?.requests ?? [];

    //Fill the maps in 2 for loops
    for(String? requestID in requestIDList){

      myRequest? currentRequest = await requestDatabaseRef.getRequestByID(requestID);
      requestIDtoMyRequestMap[requestID] = currentRequest;
      List acceptedUserIDs = currentRequest.acceptedby ?? [];

      for(var acceptedUserID in acceptedUserIDs){
        if(acceptedUserIDtoRequestID[acceptedUserID] != null){
          acceptedUserIDtoRequestID[acceptedUserID]!.add(requestID);

        }
        else{
          acceptedUserIDtoRequestID[acceptedUserID] = [requestID];
        }
      }
    }

    for(var acceptedUser in acceptedUserIDtoRequestID.keys){
      myUser? acceptedUserObj = await userDatabaseRef.getUserDataByID(acceptedUser);
      acceptedUsertoMyUser[acceptedUser] = acceptedUserObj;
    }
    notifyListeners();
    return this;
  }

  Future<void> checkUpdates() async{
    if(isUpdated){
      await fetchData();
      isUpdated = false;
    }
  }

}