import 'package:flutter/material.dart';
class BottomBarWidget extends StatefulWidget {

  BottomBarWidget({required this.currentindex});
  int currentindex;

  @override
  State<BottomBarWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  // Your screen widgets go here
  final Map routes = {
    0 : "/home",
    1 : "/search",
    2 : "/add",
    3 : "/profile",
    4 : "/myrequests"
  };



  void changeRoute(int index){
    String rootName = ModalRoute.of(context)!.settings.name!;
    if(rootName != routes[index]){
      Navigator.pushReplacementNamed(context, routes[index]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentindex,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        changeRoute(index);
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.amber,
          icon: Icon(Icons.add),
          label: 'Add',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
        BottomNavigationBarItem(

          backgroundColor: Colors.amber,
          icon: Icon(Icons.mail),
          label: 'Requests',
        ),
      ],
    );
  }
}
