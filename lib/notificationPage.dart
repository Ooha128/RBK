import 'package:flutter/material.dart';
import 'package:rbk/bottom_nav.dart';

class notificationPage extends StatefulWidget {
  static const String routeName = '/notificationPage';

  @override
  State<notificationPage> createState() => _notificationPageState();
}

class _notificationPageState extends State<notificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
      ),
      body: const Center(child: Text("This is notification page")),
      bottomNavigationBar: BottomNav(),
    );
  }
}
