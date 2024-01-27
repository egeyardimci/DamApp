// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:agaol/bottomBarWidget.dart';
import 'package:agaol/topBarWidget.dart';
import 'package:flutter/widgets.dart';

class RequestCardWidget extends StatelessWidget {

  String name;
  String date;
  String time;
  String location;
  String whoPays;
  String lookingFor;

  RequestCardWidget({super.key,required this.name,required this.date, required this.time,
  required this.location, required this.lookingFor, required this.whoPays}
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Card(
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Image(
                          image: AssetImage("assets/foto.png"),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Name: $name",
                                style: TextStyle(
                                  fontSize: 20
                                ),
                              ),
                              Text("Date: $date",
                                style: TextStyle(
                                    fontSize: 20
                                ),
                              ),
                              Text("Time: $time",
                                style: TextStyle(
                                    fontSize: 20
                                ),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Location: $location",
                                style: TextStyle(
                                    fontSize: 20
                                ),
                              ),
                              Text("Who pays: $whoPays",
                                style: TextStyle(
                                    fontSize: 20
                                ),
                              ),
                              Text("Looking for: $lookingFor",
                                style: TextStyle(
                                    fontSize: 20
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
