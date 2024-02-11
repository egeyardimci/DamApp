import 'package:agaol/Providers/likedWidgetProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          onPressed: () async{
            Navigator.pushReplacementNamed(context,"/liked");
          },
        ),
        IconButton(

          color: Colors.white,
          icon: Icon(Icons.message),
          onPressed: () {
            // Add action for the settings button
            Navigator.pushReplacementNamed(context, "/messages");
          },

        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}