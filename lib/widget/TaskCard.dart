import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rbk/utils/AppSpaces.dart';

class TaskModel {
  final String title;
  final String description;
  final String time;
  final String date;

  const TaskModel({
    required this.title,
    required this.description,
    required this.time,
    required this.date,
  });
}

class TaskCard extends StatefulWidget {
  const TaskCard({
    Key? key,
    required this.task,
  }) : super(key: key);
  final TaskModel task;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        margin: EdgeInsets.only(right: 5, bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 35),
        child: Row(
          children: [
            Image.asset(
              'assets/task.png',
              height: 60,
            ),
            AppSpaces.horizontal20,
            Expanded(
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Text(
                  widget.task.title,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                AppSpaces.vertical5,
                Text(
                  widget.task.description,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Get.theme.colorScheme.secondary,
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
      Positioned(
        bottom: 0,
        right: 0,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
            color: Get.theme.canvasColor,
          ),
          padding: EdgeInsets.all(10),
          child: Text(
            widget.task.time,
            style: TextStyle(
                fontSize: 15,
                color: Color.fromARGB(255, 7, 103, 237),
                fontWeight: FontWeight.bold),
          ),
        ),
      )
    ]);
  }
}
