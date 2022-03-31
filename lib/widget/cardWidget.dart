// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:rbk/drawer.dart';
import 'package:rbk/fertilizerlist.dart';
import 'package:flutter/material.dart';

class GridScreen extends StatefulWidget {
  const GridScreen({Key? key}) : super(key: key);

  @override
  State<GridScreen> createState() => _GridScreenState();
}

class _GridScreenState extends State<GridScreen> {
  int selectedOptionIndex = 0;

  get colorstheme => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff84CC83),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            MyDrawer();
          },
          color: Colors.white,
          tooltip: 'Menu',
        ),
        title: Text(
          'Fertilizers',
          style: const TextStyle(color: Colors.black),
        ),
        actions: _buildActions(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) => TopProducts().topProductList[index],
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          itemCount: TopProducts().topProductList.length,
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  List<Widget> _buildActions() => <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
          color: Colors.grey,
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
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Color(0xff84CC83),
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
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    decoration: BoxDecoration(
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
                          color: Colors.green,
                        ),
                        Text(
                          bottomNavigationBarOptions[index],
                          style: TextStyle(
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
