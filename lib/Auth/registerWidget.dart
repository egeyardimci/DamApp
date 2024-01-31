import 'package:flutter/material.dart';
class RegisterWidget extends StatefulWidget {

  final Function(int) updateAuthState;
  const RegisterWidget({super.key, required this.updateAuthState});

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0.0,
        title: Text('DamApp Register Form',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            widget.updateAuthState(0);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          labelText: 'Enter Name',
                        ),
                        onChanged: (name) {
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
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Enter Age',
                        ),
                        onChanged: (age) {
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
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          labelText: 'Enter Gender',
                        ),
                        onChanged: (value) {
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
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Enter Mail',
                        ),
                        onChanged: (value) {
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
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          labelText: 'Enter Password',
                        ),
                        onChanged: (value) {
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
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          labelText: 'Enter Preference',
                        ),
                        onChanged: (value) {
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50,
          padding: EdgeInsets.symmetric(),
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              'Continue',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
