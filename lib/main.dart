import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rbk/welcome.dart';
import 'package:rbk/sales.dart';

import 'ToDo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      home: ToDo(),
    );
  }
}
