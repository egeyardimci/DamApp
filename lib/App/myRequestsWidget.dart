import 'package:agaol/App/requestCardWidget.dart';
import 'package:agaol/App/topBarWidget.dart';
import 'package:agaol/Database/requestDatabase.dart';
import 'package:agaol/Models/requestModel.dart';
import 'package:agaol/Models/userModel.dart';
import 'package:agaol/loadingWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bottomBarWidget.dart';

class MyRequestsWidget extends StatelessWidget {
  MyRequestsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: TopBarWidget(title: 'DamApp',),
      body: Consumer<userRequestProvider?>(
        builder:(context,_userRequests,child) {
          if(_userRequests == null){
            return Center(
              child: LoadingWidget(),
            );
          }
          else{
            List<Widget> requestWidgetList = [];

            for(myRequest? requestData in _userRequests.userRequests ?? []){
              requestWidgetList.add(RequestCardWidget(
                  name: requestData?.name ?? "",
                  date: requestData?.date ?? "",
                  time: requestData?.time ?? "",
                  location: requestData?.location ?? "",
                  lookingFor: requestData?.preference ??
                      "",
                  whoPays: requestData?.whopays ?? ""));
            }


            return SingleChildScrollView(
              child: Column(
                children: requestWidgetList,
              ),
            );
          }
        }
      ),
      bottomNavigationBar: BottomBarWidget(currentindex: 3,),
    );;
  }
}
