import 'package:flutter/material.dart';

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
        body: Center(child: Text("This is profile page")));
  }
}
