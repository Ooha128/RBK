import 'package:flutter/material.dart';
import 'package:rbk/drawer.dart';

class sales extends StatefulWidget {
  static const String routeName = '/sales';
  sales({Key? key}) : super(key: key);

  @override
  State<sales> createState() => _salesState();
}

class _salesState extends State<sales> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("My Profile"),
        ),
        drawer: MyDrawer(),
        body: Center(child: Text("This is sales page")));
  }
}
