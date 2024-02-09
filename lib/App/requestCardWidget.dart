// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:agaol/App/bottomBarWidget.dart';
import 'package:agaol/App/topBarWidget.dart';
import 'package:flutter/widgets.dart';

class RequestCardWidget extends StatelessWidget {

  String name;
  String age;
  String date;
  String time;
  String location;
  String whoPays;
  String lookingFor;

  RequestCardWidget({super.key,required this.name,required this.age, required this.date, required this.time,
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
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade600, width: 2.0), // Set border color and width
                              borderRadius: BorderRadius.zero
                          ),
                          child: Image(
                            image: AssetImage("assets/paul_mescal.jpg"),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "$name, ",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: "$age",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5.0),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Date : ",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: "$date",
                                  style: TextStyle(
                                    fontSize: 17.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5.0),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Time : ",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: "$time",
                                  style: TextStyle(
                                    fontSize: 17.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5.0),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Location : ",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: "$location",
                                  style: TextStyle(
                                    fontSize: 17.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5.0),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Looking For : ",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: "$lookingFor",
                                  style: TextStyle(
                                    fontSize: 17.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5.0),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Bill Share : ",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: "$whoPays",
                                  style: TextStyle(
                                    fontSize: 17.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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