import 'package:agaol/Auth/authService.dart';
import 'package:agaol/Database/requestDatabase.dart';
import 'package:agaol/Database/userDatabase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:agaol/App/bottomBarWidget.dart';
import 'package:agaol/App/topBarWidget.dart';
import 'package:provider/provider.dart';
import 'package:agaol/Models/userModel.dart';
import 'package:agaol/loadingWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

import '../Models/requestModel.dart';

class AddWidget extends StatefulWidget {
  AddWidget({super.key});

  @override
  State<AddWidget> createState() => _AddWidgetState();

}

class _AddWidgetState extends State<AddWidget> {

  final _formKey = GlobalKey<FormState>();


  String whopays = "";
  String date = "";
  String location = "";
  String time = "";

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        date = picked.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    final _uid = Provider.of<User?>(context)!.uid;

    return Scaffold(
      appBar: TopBarWidget(title: 'DamApp',),
      bottomNavigationBar: BottomBarWidget(currentindex: 2,),
      body: Consumer<myUserProvider>(
        builder:(context,_user,child) {
          print(_user.currentUser);
          if(_user.currentUser == null){
            return LoadingWidget();
          }
          return SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Card(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            children: [
                              DropdownButtonFormField<String>(
                                validator: (value) => value == null ? 'Select your bill share option' : null,
                                decoration: InputDecoration(
                                  labelText: 'Bill Share',
                                  icon: Icon(Icons.attach_money),
                                ),
                                items: ['Split', 'I will pay', 'Date will pay'].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    whopays = value!;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            children: [
                              TextFormField(
                                validator: (value) => value!.isEmpty ? 'Enter a location' : null,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  icon: Icon(Icons.location_on),
                                  labelText: 'Location ',
                                ),
                                onChanged: (value) {
                                  setState(() => location = value);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            children: [
                              TextFormField(
                                validator: (value) => value!.isEmpty ? 'Enter a exact date' : null,
                                keyboardType: TextInputType.datetime,
                                decoration: InputDecoration(
                                  icon: Icon(Icons.date_range),
                                  labelText: 'Enter Exact Day of Current Month ',
                                ),
                                onChanged: (value) {
                                  setState(() => date = value);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            children: [
                              TextFormField(
                                validator: (value) => value!.isEmpty ? 'Enter an hour' : null,
                                keyboardType: TextInputType.datetime,
                                decoration: InputDecoration(
                                  icon: Icon(Icons.timelapse_rounded),
                                  labelText: 'Enter Hour of the Date ',
                                ),
                                onChanged: (value) {
                                  setState(() => time = value);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: Column(
                      children: [
                        Text("${date}".split(' ')[0]),
                        const SizedBox(height: 20.0,),
                        ElevatedButton(
                          onPressed: () => _selectDate(context),
                          child: const Text('Select date'),
                        ),
                      ],
                    ),
                  ),

                  ElevatedButton.icon(
                    onPressed: () async {
                      if(_formKey.currentState!.validate() ){

                        final requestDatabase newRequest = requestDatabase();
                        final userDatabase userDatabaseRef = userDatabase(uid: AuthService().currentUser!.uid);

                        DocumentReference newRequestDocument = await newRequest.addNewRequest(_user.currentUser?.name, _uid,
                            _user.currentUser?.age, time, whopays,
                            _user.currentUser?.preference, location ,date);

                        String? newRequestID = newRequestDocument.id;
                        await userDatabaseRef.updateRequestList(newRequestID);
                        await _user.updateUserData();
                        Provider.of<userRequestProvider>(context, listen: false).setUserRequests(_user.userobj?.requests);

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("A new request is succesfully made"),
                            duration: Duration(seconds: 2),
                            backgroundColor: Colors.green,
                          ),
                        );
                      }
                      else {

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Request demand is failed"),
                            duration: Duration(seconds: 2),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    icon: Icon(Icons.add),
                    label: Text('Add Dam Request'),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}