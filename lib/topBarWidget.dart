import 'package:flutter/material.dart';

class TopBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  TopBarWidget({required this.title});

  @override
  Widget build(BuildContext context) {
    return  AppBar(
      backgroundColor: Colors.red,
      title: Text(
        title,
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
        ),
      ),
      actions: [
        IconButton(
          color: Colors.white,
          icon: Icon(Icons.favorite),
          onPressed: () {
            // Add action for the settings button
            print('Settings button pressed');
          },
        ),
        IconButton(

          color: Colors.white,
          icon: Icon(Icons.message),
          onPressed: () {
            // Add action for the settings button
            print('Settings button pressed');
          },

        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}