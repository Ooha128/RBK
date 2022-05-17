import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rbk/utils/AppAssets.dart';
import 'package:rbk/utils/AppSpaces.dart';
import 'package:rbk/widget/FormElement.dart';
import 'package:rbk/widget/Buttons.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final TextEditingController _dateController =
      TextEditingController(text: DateTime.now().toString().substring(0, 10));
  final TextEditingController _timeController =
      TextEditingController(text: DateTime.now().toString().substring(11, 16));
  final TextEditingController _descController =
      TextEditingController(text: 'Task Description');
  final TextEditingController _nameController =
      TextEditingController(text: 'Task Name');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        AppSpaces.vertical30,
        Row(children: [
          AppSpaces.horizontal10,
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: ImageIcon(AssetImage(AppAssets.arrow))),
          Spacer(),
          IconButton(
              onPressed: Get.back, icon: ImageIcon(AssetImage(AppAssets.menu))),
          AppSpaces.horizontal20,
        ]),
        AppSpaces.vertical10,
        Row(children: [
          AppSpaces.horizontal30,
          Text(
            'Create New task',
            style: TextStyle(
              color: Colors.black,
              fontSize: 27,
              fontWeight: FontWeight.w700,
            ),
          ),
          Spacer(),
          Image.asset(
            AppAssets.note,
            height: 40,
          ),
          AppSpaces.horizontal30,
        ]),
        Expanded(
            child: ListView(
          padding: EdgeInsets.zero,
          children: [
            AppSpaces.vertical25,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: AppTextField(
                label: 'Task Name',
                value: _nameController,
              ),
            ),
            AppSpaces.vertical25,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(children: [
                Expanded(
                  flex: 20,
                  child: AppTextField(
                    label: 'Date',
                    value: _dateController,
                  ),
                ),
                Spacer(flex: 10),
                InkWell(
                  onTap: () async {
                    var date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100));
                    _dateController.text = date.toString().substring(0, 10);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Get.theme.primaryColor,
                    ),
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.calendar_today,
                      color: Colors.white,
                    ),
                  ),
                ),
              ]),
            ),
            AppSpaces.vertical25,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(children: [
                Expanded(
                  flex: 20,
                  child: AppTextField(
                    label: 'Time',
                    value: _timeController,
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () async {
                    var time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                      initialEntryMode: TimePickerEntryMode.dial,
                    );
                    _timeController.text =
                        time!.hour.toString() + ":" + time.minute.toString();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Get.theme.primaryColor,
                    ),
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.timer,
                      color: Colors.white,
                    ),
                  ),
                ),
              ]),
            ),
            AppSpaces.vertical25,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: AppTextField(
                label: 'Description',
                value: _descController,
              ),
            ),
            AppSpaces.vertical25,
            Center(
              child: AppButton(
                  label: 'Create task',
                  onTap: () => {
                        FirebaseFirestore.instance.collection('Todo').add({
                          'title': _nameController.text,
                          'Description': _descController.text,
                          'Date': _dateController.text,
                          'Time': _timeController.text,
                        }),
                        Fluttertoast.showToast(
                            msg: "Task Added Successfully",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.blue,
                            textColor: Colors.white,
                            fontSize: 16.0),
                        Navigator.pop(context),
                      }),
            ),
            AppSpaces.vertical25,
          ],
        )),
      ]),
    );
  }
}
