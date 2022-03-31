import 'package:flutter/material.dart';
import 'package:rbk/drawer.dart';

class profilePage extends StatefulWidget {
  static const String routeName = '/profilePage';

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("My Profile"),
        ),
        drawer: MyDrawer(),
        body: Center(child: Text("This is profile page")));
  }
}
