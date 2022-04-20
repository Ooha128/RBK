import 'package:rbk/FertilizerTile.dart';
import 'package:flutter/material.dart';
import 'package:rbk/dialogue.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rbk/homePage.dart';

class GridScreen extends StatefulWidget {
  const GridScreen({Key? key}) : super(key: key);

  @override
  State<GridScreen> createState() => _GridScreenState();
}

class _GridScreenState extends State<GridScreen> {
  List<FertilizerTile> l = [];
  int selectedOptionIndex = 0;
  void addUserData(FertilizerTile user) {
    setState(() {
      l.add(user);
    });
  }

  void showUserDialog() {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          content: AddUserDialog1(addUserData),
        );
      },
    );
  }

  get colorstheme => Colors.purple;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          'Fertilizers',
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              icon: Icon(Icons.home)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection('fertilizers').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return ListView(
              children: snapshot.data!.docs.map((document) {
                return Container(
                  child: Center(
                      child: FertilizerTile(
                          title: document['Name'],
                          company: document['Company'],
                          availability: document['Availability'],
                          msp: document['MSP'])),
                );
              }).toList(),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: showUserDialog,
        child: Icon(
          Icons.add,
        ),
      ),
      //bottomNavigationBar: BottomNav(),
    );
  }

  List<Widget> _buildActions() => <Widget>[
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
          color: Colors.white,
          tooltip: 'Search',
        ),
      ];
}
