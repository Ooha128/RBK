import 'package:flutter/material.dart';
import 'package:rbk/HomeScreen.dart';

class availability extends StatefulWidget {
  static const String routeName = '/availability';
  availability({Key? key}) : super(key: key);

  @override
  State<availability> createState() => _availabilityState();
}

class _availabilityState extends State<availability> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home_Screen(),
    );
  }
}
