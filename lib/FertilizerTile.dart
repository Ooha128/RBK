import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rbk/avail.dart';
import 'package:rbk/avail.dart';

class FertilizerTile extends StatefulWidget {
  final String title;
  final String company;
  final int availability;
  final int msp;

  FertilizerTile({
    Key? key,
    required this.title,
    required this.company,
    required this.availability,
    required this.msp,
  }) : super(key: key);

  @override
  State<FertilizerTile> createState() => _FertilizerTileState();
}

class _FertilizerTileState extends State<FertilizerTile> {
  void showUserDialog() {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          content: Avail(widget.title, widget.company),
        );
      },
    );
  }

  final String avb = '0';
  final Color color = Color(0xffF4DEF8);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 250,
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10)),
        ),
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ListTile(
                    title: Text(
                      widget.title,
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(widget.company,
                              style: const TextStyle(
                                  fontSize: 25.0, fontWeight: FontWeight.bold)),
                          Text(
                              'Availability: ' + widget.availability.toString(),
                              style: const TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          Text('MSP Value:' + widget.msp.toString(),
                              style: const TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ]),
                  ),
                  IconButton(
                    icon: Icon(Icons.edit),
                    alignment: Alignment.bottomRight,
                    onPressed: showUserDialog,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
