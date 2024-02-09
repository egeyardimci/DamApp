import 'package:flutter/cupertino.dart';
import 'package:agaol/Models/requestModel.dart';

class HomeWidgetProvider with ChangeNotifier{

  List<myRequest>? requestList = [];

  Future<HomeWidgetProvider?> refreshRequests () async {
    print("cardim");
    this.requestList = await myRequestProvider().getRequests();
    notifyListeners();
    return this;
  }

}