import 'package:flutter/material.dart';
import 'package:rbk/drawer.dart';

class homePage extends StatelessWidget {
  static const String routeName = '/homePage';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        drawer: MyDrawer(),
        body: Center(child: Text("This is home page")));
  }
}
