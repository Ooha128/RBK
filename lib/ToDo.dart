import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rbk/ToDoController.dart';
import 'package:rbk/AddScreen.dart';
import 'package:rbk/utils/AppAssets.dart';
import 'package:rbk/utils/AppSpaces.dart';
import 'package:rbk/widget/TaskCard.dart';
import 'homePage.dart';
import 'package:intl/intl.dart';

class ToDo extends StatefulWidget {
  const ToDo({Key? key}) : super(key: key);

  @override
  State<ToDo> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ToDo> {
  DateTime now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ToDoController>(
      init: ToDoController(),
      builder: (controller) => SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              Column(
                children: [
                  Container(
                    color: Get.theme.primaryColor,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                        ),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          AppSpaces.vertical30,
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomePage()));
                                  },
                                  padding: EdgeInsets.only(left: 25),
                                  alignment: Alignment.topLeft,
                                  icon: Icon(
                                    Icons.home,
                                    size: 40,
                                    color: Colors.blue,
                                  )),
                            ],
                          ),
                          AppSpaces.vertical25,
                          Row(children: [
                            AppSpaces.horizontal30,
                            Text(
                              'My Task',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AddScreen()));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Get.theme.primaryColor,
                                ),
                                width: 50,
                                height: 50,
                                child: Center(
                                    child: Image.asset(
                                  AppAssets.plus,
                                  width: 20,
                                  height: 20,
                                )),
                              ),
                            ),
                            AppSpaces.horizontal30,
                          ]),
                          AppSpaces.vertical15,
                          Row(children: [
                            AppSpaces.horizontal30,
                            Text(
                              'Today',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            Text(
                              DateFormat.yMMMMd().format(now).toString(),
                              style: TextStyle(
                                color: Get.theme.colorScheme.secondary,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            AppSpaces.horizontal30,
                          ]),
                          AppSpaces.vertical30,
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Get.theme.primaryColor,
                          borderRadius:
                              BorderRadius.only(topRight: Radius.circular(30)),
                        ),
                        padding: EdgeInsets.only(top: 30),
                        child: Row(children: [
                          AppSpaces.horizontal30,
                          Expanded(
                            child: StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection('Todo')
                                  .snapshots(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                return ListView(
                                  children: snapshot.data!.docs.map((document) {
                                    return Container(
                                      child: Center(
                                          child: TaskCard(
                                              task: TaskModel(
                                                  title: document['title'],
                                                  description:
                                                      document['Description'],
                                                  time: document['Time'],
                                                  date: document['Date']))),
                                    );
                                  }).toList(),
                                );
                              },
                            ),
                          ),
                          AppSpaces.horizontal25,
                        ]),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppAssets.corner),
                      fit: BoxFit.cover,
                    ),
                  ),
                  height: 115,
                  width: 135,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
