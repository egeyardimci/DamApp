import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileCardWidget extends StatelessWidget {

  String name;
  String gender;
  String preference;
  int age;

  ProfileCardWidget({super.key, required this.name,required this.gender, required this.age, required this.preference});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.50,
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
                          image: AssetImage("assets/foto.jpeg"),
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
                              Text("Gender: $gender",
                                style: TextStyle(
                                    fontSize: 20
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Age: $age",
                                style: TextStyle(
                                    fontSize: 20
                                ),
                              ),
                              Text("Preference: $preference",
                                style: TextStyle(
                                    fontSize: 20
                                ),
                              ),
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
