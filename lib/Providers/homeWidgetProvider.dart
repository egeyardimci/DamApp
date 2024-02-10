import 'package:agaol/Database/requestDatabase.dart';
import 'package:flutter/cupertino.dart';
import 'package:agaol/Models/requestModel.dart';

//PROVIDER FOR THE HOME WIDGET
class HomeWidgetProvider with ChangeNotifier{

  List<myRequest>? requestList = [];

  Future<HomeWidgetProvider?> refreshRequests () async {
    requestList = await requestDatabase().getRequests();
    notifyListeners();
    return this;
  }

}