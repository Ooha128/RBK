import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rbk/utils/AppSpaces.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
  bool? value = false;
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.black;
  }

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
            Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith(getColor),
                value: value,
                onChanged: (bool? v) {
                  setState(
                    () {
                      FirebaseFirestore.instance
                          .collection('Todo')
                          .where('Date', isEqualTo: widget.task.date)
                          .where('Time', isEqualTo: widget.task.time)
                          .get()
                          .then((v) {
                        v.docs.forEach((element) {
                          print(element.id);
                          FirebaseFirestore.instance
                              .collection('Todo')
                              .doc(element.id)
                              .delete();
                          Fluttertoast.showToast(
                              msg: "Task Completed",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.blue,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        });
                      });
                    },
                  );
                }),
            Text(
              widget.task.date,
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Get.theme.colorScheme.secondary,
              ),
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
            color: Colors.blue,
          ),
          padding: EdgeInsets.all(10),
          child: Text(
            widget.task.time,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      )
    ]);
  }
}
