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
import '../Providers/homeWidgetProvider.dart';
import '../Providers/myUserProvider.dart';
import '../Providers/userRequestProvider.dart';

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
      helpText: 'Day the date will take place',
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        date = picked.toString().split(" ")[0];
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      helpText: 'Day the date will take place',
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (picked != null) {
      setState(() {
        time = "${picked.hour}:${picked.minute}";
        print(time);
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
                  Card (
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: TextFormField(
                            validator: (value) => value!.isEmpty ? 'Pick a date' : null,
                            decoration: InputDecoration(
                              icon: Icon(Icons.date_range),
                              labelText: 'Date',
                            ),
                            readOnly: true,
                            onTap: (){
                              _selectDate(context);
                            },
                            onChanged: (value) {
                              print(date);
                              setState(() => date = value);
                            },
                            controller: TextEditingController(text: date),
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
                                validator: (value) => value!.isEmpty ? 'Pick a time' : null,
                                decoration: InputDecoration(
                                  icon: Icon(Icons.timelapse_rounded),
                                  labelText: 'Time',
                                ),
                                readOnly: true,
                                onTap: (){
                                  _selectTime(context);
                                },
                                onChanged: (value) {
                                  print(time);
                                  setState(() => time = value);
                                },
                                controller: TextEditingController(text: time),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () async {
                      if(_formKey.currentState!.validate() ){

                        final requestDatabase newRequest = requestDatabase();
                        final userDatabase userDatabaseRef = userDatabase(uid: AuthService().currentUser!.uid);

                        DocumentReference newRequestDocument = await newRequest.addNewRequest( _uid, time, whopays, location , date);

                        String? newRequestID = newRequestDocument.id;
                        await userDatabaseRef.updateRequestListAdd(newRequestID);
                        await _user.updateUserData();
                        await Provider.of<userRequestProvider>(context, listen: false).setUserRequests(_user.userobj?.requests);
                        await Provider.of<HomeWidgetProvider?>(context,listen: false)?.refreshRequests();

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