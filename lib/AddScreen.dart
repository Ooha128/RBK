import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rbk/utils/AppAssets.dart';
import 'package:rbk/utils/AppSpaces.dart';
import 'package:rbk/widget/FormElement.dart';
import 'package:rbk/widget/Buttons.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  TextEditingController _descController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
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
              child: Row(
                children: [
                  AppTextField(
                    label: 'Task Name',
                    value: _nameController,
                  ),
                ],
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
                Spacer(flex: 10),
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
                          'Title': _nameController.text,
                          'Description': _descController.text,
                          'Date': _dateController.text,
                          'Time': _timeController
                        }),
                        Get.snackbar('Success', 'Task Created Successfully'),
                      }),
            ),
            AppSpaces.vertical25,
          ],
        )),
      ]),
    );
  }
}
