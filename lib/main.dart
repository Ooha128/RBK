import 'package:flutter/material.dart';
import 'package:rbk/Screens/Welcome/welcome_screen.dart';
import 'package:rbk/pageRoutes.dart';
import 'package:rbk/profilePage.dart';
import 'notificationPage.dart';
import 'availability.dart';
import 'package:rbk/homePage.dart';
import 'package:rbk/sales.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RBK Sahayak',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: WelcomeScreen(),
      routes: {
        pageRoutes.home: (context) => homePage(),
        pageRoutes.avail: (context) => availability(),
        pageRoutes.sale: (context) => sales(),
        pageRoutes.profile: (context) => profilePage(),
        pageRoutes.notification: (context) => notificationPage(),
      },
    );
  }
}
