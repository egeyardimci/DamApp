import 'package:agaol/Database/requestDatabase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:agaol/App/bottomBarWidget.dart';
import 'package:agaol/App/topBarWidget.dart';
import 'package:provider/provider.dart';

class AddWidget extends StatefulWidget {
  AddWidget({super.key});

  @override
  State<AddWidget> createState() => _AddWidgetState();

  String preference = "";
  String share = "";
  String age = "";
  String date = "";
  String location = "";
  String time = "";
}

class _AddWidgetState extends State<AddWidget> {
  @override
  Widget build(BuildContext context) {
    final User? user = Provider.of<User?>(context);
    return Scaffold(
      appBar: TopBarWidget(title: 'DamApp',),
      bottomNavigationBar: BottomBarWidget(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Padding(
                padding: EdgeInsets.symmetric(),
                child: ExpansionTile(
                  title: ListTile(
                    leading: Icon(Icons.person),
                    title: Text("Dating Preferance"),
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Text("Male"),
                      onTap: () {
                        widget.preference = "Male";
                      },
                    ),
                    ListTile(
                      title: Text("Female"),
                      onTap: () {
                        widget.preference = "Female";
                      },
                    ),
                    ListTile(
                      title: Text("Other"),
                      onTap: () {
                        widget.preference = "Other";
                      },
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.symmetric(),
                child: ExpansionTile(
                  title: ListTile(
                    leading: Icon(Icons.attach_money),
                    title: Text("Bill Share"),
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Text("Split"),
                      onTap: () {
                        widget.share = "Split";
                      },
                    ),
                    ListTile(
                      title: Text("I will pay"),
                      onTap: () {
                        widget.share = "I will pay";
                      },
                    ),
                    ListTile(
                      title: Text("Date will pay"),
                      onTap: () {
                        widget.share = "Date will pay";
                      },
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.symmetric(),
                child: ExpansionTile(
                  title: ListTile(
                    leading: Icon(Icons.timelapse_sharp),
                    title: Text("Age"),
                  ),
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: 'Age',
                            ),
                            onChanged: (value) {
                              widget.age = value;
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.symmetric(),
                child: ExpansionTile(
                  title: ListTile(
                    leading: Icon(Icons.date_range),
                    title: Text("Date"),
                  ),
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: 'Exact Date',
                            ),
                            onChanged: (value) {
                              widget.date = value;
                            },
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: 'Time',
                            ),
                            onChanged: (value) {
                              widget.time = value;
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.symmetric(),
                child: ExpansionTile(
                  title: ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text("Location"),
                  ),
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: 'Location',
                            ),
                            onChanged: (value) {
                              widget.location = value;
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.symmetric(),
                child: ExpansionTile(
                  title: ListTile(
                    leading: Icon(Icons.photo),
                    title: Text("Photo"),
                  ),
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.add),
                                label: Text('Add Photo'),
                              ),
                              SizedBox(height: 8)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () async {
              },
              icon: Icon(Icons.add),
              label: Text('Add Dam Request'),
            )
          ],
        ),
      ),
    );
  }
}
