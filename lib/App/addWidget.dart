import 'package:flutter/material.dart';
import 'package:agaol/App/bottomBarWidget.dart';
import 'package:agaol/App/topBarWidget.dart';

class AddWidget extends StatefulWidget {
  AddWidget({super.key});

  @override
  State<AddWidget> createState() => _AddWidgetState();
}

class _AddWidgetState extends State<AddWidget> {
  @override
  Widget build(BuildContext context) {
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
                      onTap: () {},
                    ),
                    ListTile(
                      title: Text("Female"),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Text("Other"),
                      onTap: () {},
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
                      onTap: () {},
                    ),
                    ListTile(
                      title: Text("I will pay"),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Text("Date will pay"),
                      onTap: () {},
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
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Age',
                            ),
                            onChanged: (value) {
                              // Handle the minimum age input value
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
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Exact Date',
                            ),
                            onChanged: (value) {
                              // Handle the minimum age input value
                            },
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Time',
                            ),
                            onChanged: (value) {
                              // Handle the minimum age input value
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
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Location',
                            ),
                            onChanged: (value) {
                              // Handle the minimum age input value
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
              onPressed: () {},
              icon: Icon(Icons.add),
              label: Text('Add Dam Request'),
            )
          ],
        ),
      ),
    );
  }
}
