import 'package:agaol/App/requestCardWidget.dart';
import 'package:agaol/App/topBarWidget.dart';
import 'package:agaol/Auth/authService.dart';
import 'package:agaol/Database/requestDatabase.dart';
import 'package:agaol/Database/userDatabase.dart';
import 'package:agaol/Models/requestModel.dart';
import 'package:agaol/Models/userModel.dart';
import 'package:agaol/loadingWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bottomBarWidget.dart';

class MyRequestsWidget extends StatefulWidget {
  MyRequestsWidget({super.key});

  @override
  State<MyRequestsWidget> createState() => _MyRequestsWidgetState();
}

class _MyRequestsWidgetState extends State<MyRequestsWidget> {

  bool reload = false;
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
                  age: requestData?.age ?? "",
                  date: requestData?.date ?? "",
                  time: requestData?.time ?? "",
                  location: requestData?.location ?? "",
                  lookingFor: requestData?.preference ??
                      "",
                  whoPays: requestData?.whopays ?? ""));
              requestWidgetList.add(ElevatedButton(
                  onPressed:() async{
                    final myUserProvider _user = Provider.of<myUserProvider>(context,listen: false);
                    userDatabase userDatabaseRef = userDatabase(uid: AuthService().currentUser!.uid);
                    await userDatabaseRef.updateRequestListDelete(requestData?.requestid);
                    await _user?.updateUserData();
                    await Provider.of<userRequestProvider>(context, listen: false).setUserRequests(_user?.userobj?.requests);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("The request is deleted!"),
                        duration: Duration(seconds: 2),
                        backgroundColor: Colors.green,
                      ),
                    );

                    setState(() {
                      reload = !reload;
                    });
                    },
                  child: Text("Delete this request")));
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
