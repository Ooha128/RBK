import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rbk/ToDoController.dart';
import 'package:rbk/models/TaskModel.dart';
import 'package:rbk/AddScreen.dart';
import 'package:rbk/utils/AppAssets.dart';
import 'package:rbk/utils/AppSpaces.dart';
import 'package:rbk/widget/TaskCard.dart';
import 'package:rbk/widget/Buttons.dart';

import 'homePage.dart';

class ToDo extends StatefulWidget {
  const ToDo({Key? key}) : super(key: key);

  @override
  State<ToDo> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ToDo> {
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
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            Text(
                              'Monday, 1 June',
                              style: TextStyle(
                                color: Get.theme.colorScheme.secondary,
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            AppSpaces.horizontal30,
                          ]),
                          AppSpaces.vertical15,
                          Container(
                            height: 60,
                            padding: EdgeInsets.only(left: 30),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 7,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 15.0),
                                  child: DayButton(
                                    dayNumber: index + 1,
                                    character: controller
                                        .getWeekOfDaysFirstLettersByIndex(
                                            index),
                                    isSelected:
                                        controller.selectedIndex == index,
                                    onTap: () {
                                      controller.setSelectedIndex(index);
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                          AppSpaces.vertical20,
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
                            child: ListView.separated(
                              controller: controller.scrollController,
                              itemCount: taskList.length,
                              padding: EdgeInsets.only(bottom: 30),
                              separatorBuilder: (context, index) =>
                                  AppSpaces.vertical30,
                              itemBuilder: (context, index) {
                                return TaskCard(task: taskList[index]);
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
                  /*child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                      icon: Icon(
                        Icons.home,
                        size: 40,
                        color: Colors.white,
                      )),*/
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
