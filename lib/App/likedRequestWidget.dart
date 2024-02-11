import 'package:agaol/App/requestCardWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/requestModel.dart';
import '../Providers/likedWidgetProvider.dart';

class LikedRequestWidget extends StatelessWidget {

  LikedRequestWidget({super.key});


  @override
  Widget build(BuildContext context) {

    LikedWidgetProvider? provider = Provider.of<LikedWidgetProvider?>(context);

    final String uid = ModalRoute.of(context)?.settings.arguments as String;

    List requestsIDList = provider?.acceptedUserIDtoRequestID[uid] ?? [];
    List<myRequest?> requestsAcceptedByThisUser = [];
    for (String? requestIDs in requestsIDList) {
      requestsAcceptedByThisUser.add(provider!.requestIDtoMyRequestMap[requestIDs]);
    }

    List<Widget> requestWidgetList = [];

    for(myRequest? requestData in requestsAcceptedByThisUser) {
      requestWidgetList.add(RequestCardWidget(
          name: requestData?.name ?? "",
          age: requestData?.age ?? "",
          date: requestData?.date ?? "",
          time: requestData?.time ?? "",
          location: requestData?.location ?? "",
          lookingFor: requestData?.preference ??
              "",
          whoPays: requestData?.whopays ?? ""));
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          "DamApp",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: requestWidgetList,
        ),
      ),

    );
  }
}
