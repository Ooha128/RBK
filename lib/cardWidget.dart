import 'package:rbk/FertilizerTile.dart';
import 'package:rbk/drawer.dart';
import 'package:flutter/material.dart';
import 'package:rbk/dialogue.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.download))
        ],
      ),
      drawer: MyDrawer(),
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
      bottomNavigationBar: _buildBottomNavigationBar(),
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

  Widget _buildBottomNavigationBar() {
    List<String> bottomNavigationBarOptions = [
      'Home',
      'Favorites',
      'Notifications',
      'Profile'
    ];
    List<IconData> bottomNavigationBarIcons = [
      Icons.home,
      Icons.favorite_border,
      Icons.notifications_none,
      Icons.person_outline
    ];

    return Container(
      height: 80,
      decoration: const BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Row(
        children: List.generate(bottomNavigationBarOptions.length, (index) {
          if (index == selectedOptionIndex) {
            return Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedOptionIndex = index;
                  });
                },
                child: Center(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          bottomNavigationBarIcons[index],
                          color: Colors.purple,
                        ),
                        Text(
                          bottomNavigationBarOptions[index],
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: Icon(
                bottomNavigationBarIcons[index],
                color: Colors.white,
              ),
            ),
          );
        }),
      ),
    );
  }
}
