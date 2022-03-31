import 'package:flutter/material.dart';
import 'package:rbk/drawer.dart';

class notificationPage extends StatefulWidget {
  static const String routeName = '/notificationPage';

  @override
  State<notificationPage> createState() => _notificationPageState();
}

class _notificationPageState extends State<notificationPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Notifications"),
        ),
        drawer: MyDrawer(),
        body: Center(child: Text("This is notification page")));
  }
}
