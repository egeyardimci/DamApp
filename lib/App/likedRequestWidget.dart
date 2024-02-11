import 'package:agaol/App/requestCardWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Models/requestModel.dart';

class LikedRequestWidget extends StatelessWidget {

  List<myRequest?> requests = [];

  LikedRequestWidget({super.key});


  @override
  Widget build(BuildContext context) {

    final List<myRequest?> requests = ModalRoute.of(context)?.settings.arguments as List<myRequest?>;

    List<Widget> requestWidgetList = [];

    for(myRequest? requestData in requests) {
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
