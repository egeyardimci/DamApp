import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileCardWidget extends StatelessWidget {

  String? name;
  String? gender;
  String? preference;
  String? age;
  String? about;

  ProfileCardWidget({super.key, required this.name,required this.gender, required this.age, required this.preference, required this.about});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 4.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4.0),
                topRight: Radius.circular(4.0),
              ),
              child: Image(
                image: AssetImage("assets/paul_mescal.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${name}",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    "${gender}, ${age}",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.grey[800],
                    ),
                  ),
                  Text(
                    "Preferred: ${preference}",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.grey[800],
                    ),
                  ),
                  SizedBox(height: 12.0),
                  Text(
                    "About Me:",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  if(about != null)
                    Text(
                      "${about}",
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  if(about == null)
                    Text(
                      "...",
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
