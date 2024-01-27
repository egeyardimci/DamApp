import 'package:flutter/material.dart';
import 'package:agaol/bottomBarWidget.dart';
import 'package:agaol/topBarWidget.dart';
class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBarWidget(title: 'DamApp',),
      bottomNavigationBar: BottomBarWidget(),
    );
  }
}
